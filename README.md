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

### add your own bash functions

1) add your super new fn to bash_src/lib.sh

```
super-newfn() {
    echo "this is my super new function"
}
```

2) using hello_fn in main.js as a template, add js function to call your bash function

```
function super-newfn(sender) {
    bashit_fn(sender, 'super-newfn);
}
```

3) to call you brand new function from index.html, you have to add an ipc call in index.html to send a message with a new name.  With a new event name sent, in main.js you have to add a listener
```
ipcMain.on('bash-function-hello_fn', (event, arg) => {
    hello_fn(event.sender);
})
```

4) Then(!) when the bash function is called, main.js will emits a message back to the renderer prefix bash-function-super- then the function name like so:

```
bash-function-super-newfn
```


