#!/bin/bash

# 'mincho' or 'gothic'
font="mincho"

# Function definition: Switch font and update cache
switch_font() {
    if [ $font == "mincho" ]; then
        echo "Switching to: Mincho font (ipaex)"
        kanji-config-updmap-sys --ja ipaex
    elif [ $font == "gothic" ]; then
        echo "Switching to: Gothic font (noEmbed)"
        kanji-config-updmap-sys --ja noEmbed
    else
        echo "Error: Invalid font specified '$1'"
        exit 1
    fi

    # Rebuild cache
    echo "Updating cache..."
    mktexlsr
    echo "Done: Font and cache have been updated."
}

# Run the script
switch_font "$font"
