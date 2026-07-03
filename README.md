# dotfiles

Midnight-blue macOS rice: [AeroSpace](https://github.com/nikitabobko/AeroSpace) +
[sketchybar](https://github.com/FelixKratz/SketchyBar) +
[JankyBorders](https://github.com/FelixKratz/JankyBorders) +
[ghostty](https://ghostty.org) + [Rectangle](https://rectangleapp.com).

The palette's source of truth is [`sketchybar/colors.sh`](sketchybar/colors.sh);
the other configs reuse the same hex values.

## Layout

| Directory | Installs to | What |
|---|---|---|
| `aerospace/aerospace.toml` | `~/.aerospace.toml` | Tiling WM — 6 workspaces, 3px gaps, top gap for the bar, emits `aerospace_workspace_change` to sketchybar |
| `sketchybar/` | `~/.config/sketchybar` | Bar (height 33) + per-workspace pills, plugins for battery / cpu / wifi / volume / clock / keyboard layout / front app / Claude token usage |
| `borders/` | `~/.config/borders` | JankyBorders — active `$BLUE`, inactive `$BG2` |
| `ghostty/` | `~/.config/ghostty` | Terminal, full midnight palette |
| `rectangle/` | macOS defaults | Window snapping — plist export + gap settings (see below) |

Neovim lives in its own repo: [oscartiz/nvim-config](https://github.com/oscartiz/nvim-config)
(tokyonight-moon with a `#0f1322` background override to match).

## Install

```bash
./install.sh
```

Symlinks the configs into place (existing non-symlink targets are backed up to
`*.bak`) and imports the Rectangle defaults. After that, edits in this repo are
live — reload with:

- sketchybar: `sketchybar --reload`
- borders: `borders <options>` (updates the running instance)
- AeroSpace: `alt-shift-c`
- Rectangle: `killall Rectangle && open -a Rectangle`

## Rectangle gaps and the notch

sketchybar is 33pt tall. On a **notched** MacBook display, macOS permanently
reserves a 33pt top strip (the menu-bar/notch area) that windows can never
occupy — sketchybar draws inside it, so Rectangle needs **no extra gap** there.
On external monitors there is no reserved strip, so Rectangle must carve out
the 33px itself.

```bash
defaults write com.knollsoft.Rectangle screenEdgeGapTop -int 33       # non-notched screens
defaults write com.knollsoft.Rectangle screenEdgeGapTopNotch -int 1   # notched screens (0 means "unset"!)
defaults write com.knollsoft.Rectangle screenEdgeGapsOnMainScreenOnly -int 0
```

Gotcha: Rectangle treats `screenEdgeGapTopNotch = 0` as *unset* and falls back
to `screenEdgeGapTop`, which stacks a second 33px gap under the bar — hence the
imperceptible `1`. See `rectangle/set-gaps.sh`; the full settings (including
keyboard shortcuts) are in `rectangle/Rectangle.plist`.
