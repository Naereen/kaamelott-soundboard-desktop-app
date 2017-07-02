// https://youtu.be/-Lu7ztlgx48?t=588
console.log("Starting my kaamelott-soundboard Electron application...");

const { app, BrowserWindow } = require('electron');

// Quit when all windows are closed.
app.on('window-all-closed', function() {
    // On OS X it is common for applications and their menu bar
    // to stay active until the user quits explicitly with Cmd + Q
    if (process.platform != 'darwin') {
        app.quit();
    }
});

app.on('ready', () => {
    console.log("App is ready... Opening a BrowserWindow...");
    let mainWindow = new BrowserWindow(
        autoHideMenuBar="false"
    );

    // mainWindow.loadURL("http://monip.org/");  // DEBUG
    console.log("Opening", `file://${__dirname}/index.html`, "in a new window...");
    mainWindow.loadURL(`file://${__dirname}/index.html`);
})
