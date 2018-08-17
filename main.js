const {app, BrowserWindow, ipcMain} = require('electron')
const child_process = require('child_process').execFile;

// Keep a global reference of the window object, if you don't, the window will
// be closed automatically when the JavaScript object is garbage collected.
let win

function createWindow () {
    // Create the browser window.
    win = new BrowserWindow({width: 800, height: 600})
    
    // and load the index.html of the app.
    win.loadFile('index.html')
    
    // Open the DevTools.
    // win.webContents.openDevTools()
    
    // Emitted when the window is closed.
    win.on('closed', () => {
        // Dereference the window object, usually you would store windows
        // in an array if your app supports multi windows, this is the time
        // when you should delete the corresponding element.
        win = null
    })
}

function bashit_fn(sender, fnName) {
    var executablePath = '/usr/bin/env'
    var source_path = 'source ' + __dirname + '/bash_src/lib.sh; ' + fnName;
    var parameters = [ 'bash', '-c', source_path ];
    
    child_process(executablePath, parameters, function(err, data) {
        var msg = data.toString();
        if (err) {
            console.error(err);
            msg += err;
        }
        
        sender.send('hello-from-main', msg);
        console.log(msg);
    });
}

function hello_fn(sender) {
    bashit_fn(sender, 'hello_fn');
}

ipcMain.on('hello-from-renderer', (event, arg) => {
    hello_fn(event.sender);
    
/*
    var executablePath = '/usr/bin/env'
    var source_path = 'source ' + __dirname + '/bash_src/lib.sh; hello_fn';
    var parameters = [ 'bash', '-c', source_path ];
    
    child_process(executablePath, parameters, function(err, data) {
        var msg = data.toString();
        if (err) {
            console.error(err);
            msg += err;
        }
        
        event.sender.send('hello-from-main', msg);
        console.log(msg);
    });
*/
})

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.on('ready', createWindow)

// Quit when all windows are closed.
app.on('window-all-closed', () => {
    app.quit()
})

app.on('activate', () => {
    // On macOS it's common to re-create a window in the app when the
    // dock icon is clicked and there are no other windows open.
    if (win === null) {
        createWindow()
    }
})

// In this file you can include the rest of your app's specific main process
// code. You can also put them in separate files and require them here.

