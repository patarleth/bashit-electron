#!/usr/bin/env bash
ICONS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

cd "$ICONS_DIR"

if command -v png2icns >/dev/null 2>&1; then
    png2icns console_large.png  -s 16,32,64,128,256
else
    echo png2icns required to generate macos icon.icns file
    echo install with
    echo npm install png2icns -g
fi

if command -v convert >/dev/null 2>&1; then

    mkdir -p ico
    convert console_large.png -scale 16 ico/icon_16.ico
    convert console_large.png -scale 32 ico/icon_32.ico
    convert console_large.png -scale 64 ico/icon_64.ico
    convert console_large.png -scale 128 ico/icon_128.ico
    convert console_large.png -scale 256 ico/icon_256.ico
    
    mkdir -p png
    convert console_large.png -scale 16 png/icon_16.png
    convert console_large.png -scale 32 png/icon_32.png
    convert console_large.png -scale 64 png/icon_64.png
    convert console_large.png -scale 128 png/icon_128.png
    convert console_large.png -scale 256 png/icon_256.png
else
    echo imagemagick convert required to generate icons
    echo install with
    echo brew install imagemagick
fi
