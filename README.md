# electron + bash demo

A slightly less simple electron app that execs a bash function when you click a button

(not using angular just yet)

### setup 
```
npm install electron-packager --save-dev
npm install electron-packager -g
npm install --save-dev bashit-electron
```

### build
```
npm install
```

### test the app before packaging
```
npm start
```

### package the app for distribution
```
electron-packager . --overwrite --platform=darwin --arch=x64 --prune=true --out=release-builds && \
electron-packager . electron-tutorial-app --overwrite --asar=true --platform=linux --arch=x64 --prune=true --out=release-builds
```

### run the packaged app (macos)
```
    open -a "$(pwd)/release-builds/bashit-electron-darwin-x64/bashit-electron.app"
```
