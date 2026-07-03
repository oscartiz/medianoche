#!/bin/bash
# Maps an app name -> a Nerd Font glyph (JetBrainsMono Nerd Font).
# Sets the global `icon_result`. Generated to disk so BMP-PUA glyphs survive.
# Tailored to the apps used here, with a generic-window fallback.

__icon_map() {
    case "$1" in
        "Arc"|"Safari"|"Brave Browser"|"Google Chrome"|"Chromium"|"Microsoft Edge")
            icon_result="" ;;
        "Firefox"|"Firefox Developer Edition")
            icon_result="" ;;
        "Ghostty"|"Terminal"|"iTerm2"|"Alacritty"|"kitty"|"WezTerm")
            icon_result="" ;;
        "Code"|"Visual Studio Code"|"VSCodium"|"Cursor"|"Antigravity"|"Windsurf"|"Neovim"|"nvim"|"Vim"|"MacVim")
            icon_result="" ;;
        "Discord"|"Vesktop"|"Discord Canary")
            icon_result="󰙯" ;;
        "Telegram"|"Telegram Lite"|"Nicegram")
            icon_result="" ;;
        "WhatsApp")
            icon_result="" ;;
        "Slack")
            icon_result="" ;;
        "Mail"|"Spark"|"Outlook"|"Microsoft Outlook")
            icon_result="" ;;
        "Obsidian"|"Notion"|"Bear"|"Logseq")
            icon_result="" ;;
        "Notes"|"Stickies")
            icon_result="" ;;
        "Calendar"|"Fantastical")
            icon_result="" ;;
        "Music"|"Apple Music")
            icon_result="" ;;
        "Spotify")
            icon_result="" ;;
        "Steam"|"Steam Helper")
            icon_result="" ;;
        "Finder")
            icon_result="" ;;
        "System Settings"|"System Preferences")
            icon_result="" ;;
        "zoom.us"|"Zoom")
            icon_result="" ;;
        "Preview"|"Photos"|"QuickTime Player")
            icon_result="" ;;
        "Activity Monitor"|"Stats")
            icon_result="" ;;
        *)
            icon_result="󰣆" ;;
    esac
}
