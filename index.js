// https://youtu.be/-Lu7ztlgx48?t=588
console.log("Starting my kaamelott-soundboard Electron application...");

const electron = require('electron');
const app = electron.app;
const Menu = electron.Menu;
const BrowserWindow = electron.BrowserWindow;

const openAboutWindow = require('about-window').default;

const shell = electron.shell;

// Quit when all windows are closed.
app.on('window-all-closed', function() {
    // On OS X it is common for applications and their menu bar
    // to stay active until the user quits explicitly with Cmd + Q
    if (process.platform != 'darwin') {
        app.quit();
    }
});

// Main function
app.on('ready', () => {
    console.log("App is ready... Opening a BrowserWindow...");
    let mainWindow = new BrowserWindow({
        icon: `${__dirname}/img/ks.jpg`,
        autoHideMenuBar: false,
        center: true
    });

    mainWindow.once("closed", function() {
        mainWindow = null;
    });

    mainWindow.webContents.on('new-window', (event, url) => {
      // stop Electron from opening another BrowserWindow
      event.preventDefault()
      // open the url in the default system browser
      shell.openExternal(url)
    });
    mainWindow.webContents.on('will-navigate', (event, url) => {
        // stop Electron from opening another BrowserWindow
        event.preventDefault()
        // open the url in the default system browser
        shell.openExternal(url)
    });

    // mainWindow.loadURL("http://monip.org/");  // DEBUG
    console.log("Opening", `file://${__dirname}/index.html`, "in a new window...");
    mainWindow.loadURL(`file://${__dirname}/index.html`);

    const menu = Menu.buildFromTemplate([
        {
            label: "Version web",
            submenu: [
                {
                    label: "Ouvrir l'application web",
                    click: () => shell.openExternal("http://kaamelott-soundboard.2ec0b4.fr/")
                }
            ]
        },
        {
            label: "Sources ?",
            submenu: [
                {
                    label: "Voir les sources de la version bureau",
                    click: () => shell.openExternal("https://github.com/Naereen/kaamelott-soundboard-desktop-app/")
                },
                {
                    label: "Voir les sources de la version web",
                    click: () => shell.openExternal("https://github.com/2ec0b4/kaamelott-soundboard/")
                }
            ]
        },
        {
            label: "À propos",
            submenu: [
                {
                    label: "À propos de cette application bureau",
                    click: () => openAboutWindow({
                                icon_path: `${__dirname}/img/ks.jpg`,
                                copyright: "Copyright © 2017 Lilian Besson (Naereen) and Antoine (2ec0b4) and collaborators",
                                homepage: "https://github.com/Naereen/kaamelott-soundboard-desktop-app/",
                                license: "No License",
                                bug_report_url: "https://github.com/Naereen/kaamelott-soundboard-desktop-app/issues/new",
                                description: "💻 📢 Application bureau sur Ubuntu, Windows et Mac OS X pour la soundboard de Kaamelott 🎶.\n« Alors, c'est classe ou c'est pas classe ? Ou c'est classe ? »\n« Putain il est fort ce con ! » me souffle-t-on.\nCette application est testée et développée sous GNU/Linux (Ubuntu 17.04) mais elle marche aussi bien sur Mac OS X, et sur Windows.",
                                adjust_window_size: true
                            })
                },
                {
                    label: "À propos de l'application web",
                    click: () => openAboutWindow({
                                icon_path: `${__dirname}/img/ks.jpg`,
                                copyright: "Copyright © 2016-17 Antoine (2ec0b4) and collaborators",
                                homepage: "https://github.com/2ec0b4/kaamelott-soundboard/",
                                license: "No License",
                                bug_report_url: "https://github.com/2ec0b4/kaamelott-soundboard//issues/new",
                                description: "💻 📢 Application web pour la soundboard de Kaamelott 🎶.\nAlors, j'ai fait deux fois le tour des Internets pour être sûr, eh ben croyez-moi, croyez-moi pas, je n'ai pas trouvé de plateforme regroupant des répliques sonores de Kaamelott.\nLorem ipsum dolor sit amet. Voilà. Et bien ça, par exemple, ça veut absolument rien dire. Et puis ce n'est pas une réplique de Kaamelott. Du coup vous ne pourrez pas l'écouter. Mais vous pouvez toujours proposer d'autres sons en contribuant à ce dépôt en proposant une fusiodemande.\nAlors, c'est classe ou c'est pas classe ? Ou c'est classe ?",
                                adjust_window_size: true
                            })
                }
            ]
        }
    ]);
    Menu.setApplicationMenu(menu);
})
