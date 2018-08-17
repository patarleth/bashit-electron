#!/usr/bin/env bash

PACKAGE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

assets/icons/genIcons.sh

cd "$PACKAGE_DIR"

target="${1:-macos}"

if [ "$target" == "all" ] || [ "$target" == "macos" ]; then
    if [ -e assets/icons/icon.icns ]; then
        electron-packager . --overwrite --platform=darwin --arch=x64 --icon=assets/icons/icon.icns --prune=true --out=release-builds
    else
        echo assets/icons/icon.icns not found
        electron-packager . --overwrite --platform=darwin --arch=x64 --prune=true --out=release-builds
    fi
fi
if [ "$target" == "all" ] || [ "$target" == "linux" ]; then
    if [ -e assets/icons/png/icon_256.png ]; then
        electron-packager . electron-tutorial-app --overwrite --asar=true --platform=linux --arch=x64 --icon=assets/icons/png/icon_256.png --prune=true --out=release-builds
    else
        echo assets/icons/icon_256.png not found
        electron-packager . electron-tutorial-app --overwrite --asar=true --platform=linux --arch=x64 --prune=true --out=release-builds
    fi
fi
