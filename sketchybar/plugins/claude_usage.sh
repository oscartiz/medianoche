#!/bin/bash

LIMIT=500000

OUTPUT=$(python3 << PYEOF
import json, os, glob, time
from datetime import datetime, timezone

limit = $LIMIT
window_start = time.time() - 5 * 3600
projects_dir = os.path.expanduser("~/.claude/projects")

total = 0
for path in glob.glob(f"{projects_dir}/**/*.jsonl", recursive=True):
    try:
        with open(path) as f:
            for line in f:
                try:
                    d = json.loads(line)
                    ts = d.get('timestamp')
                    if not ts:
                        continue
                    dt = datetime.fromisoformat(ts.replace('Z', '+00:00'))
                    if dt.timestamp() < window_start:
                        continue
                    u = d.get('message', {}).get('usage', {})
                    if u:
                        total += u.get('input_tokens', 0) + u.get('output_tokens', 0)
                except Exception:
                    pass
    except Exception:
        pass

pct = min(total / limit * 100, 100)
print(f"{pct:.0f}%")
PYEOF
)

sketchybar --set "$NAME" label="$OUTPUT"
