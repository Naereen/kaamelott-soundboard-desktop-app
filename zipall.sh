#!/usr/bin/env bash

echo "Removing the bower_components and node_modules directories from compiled apps..."
find . -type d -iname 'kaamelott-soundboard-desktop-app*' -exec echo rm -rvf ./{}/bower_components/ ./{}/node_modules/ \;
echo "OK ? Ctrl+C to cancel, Enter to validate"
read || exit
find . -type d -iname 'kaamelott-soundboard-desktop-app*' -exec rm -rvf ./{}/bower_components/ ./{}/node_modules/ \;
echo "DONE"
echo "Removed the bower_components and node_modules directories from compiled apps :-)"

echo

echo "Zipping all the applications..."
find . -type d -iname 'kaamelott-soundboard-desktop-app*' -exec echo zip -r -9 -y zips/{}.zip {} \;
echo "OK ? Ctrl+C to cancel, Enter to validate"
read || exit
find . -type d -iname 'kaamelott-soundboard-desktop-app*' -exec zip -r -9 -y zips/{}.zip {} \;
echo "DONE"
echo "Zipped all the applications in zips/ folder :-)"

echo

echo "Now, go to https://github.com/Naereen/kaamelott-soundboard-desktop-app/releases/edit/ and update the latest release..."
