#!/usr/bin/env bash
ICONS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

cd "$ICONS_DIR"

png2icns console_large.png  -s 16,32,64,128,256

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
