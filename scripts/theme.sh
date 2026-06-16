#!/bin/bash

WALLPAPER_DIR="$HOME/wallpapergif"

# Start awww daemon if not running
if ! pgrep -x "awww-daemon" >/dev/null; then
    echo "Starting awww daemon..."
    awww-daemon &
    sleep 0.5
fi

# menu selector
SELECTION=$(
    find "$WALLPAPER_DIR" -type f \
        \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) |
    fzf \
        --prompt="Select Theme For Ashton: " \
        --height=40% \
        --layout=reverse \
        --border # settings for fzf
)

# Exit if nothing selected
[ -z "$SELECTION" ] && exit 0

# Apply wallpaper
awww img "$SELECTION" \
    --transition-type wipe \
    --transition-step 120 \
    --transition-fps 165

# Generate terminal/theme colors
if command -v wal >/dev/null 2>&1; then # checks if pywal is installed

    wal -i "$SELECTION" -q # generate colors of the wallpaper

    # Refresh Rofi theme cache
    touch "$HOME/.cache/wal/colors-rofi-dark.rasi"
fi
