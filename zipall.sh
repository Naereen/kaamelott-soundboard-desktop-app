#!/usr/bin/env bash

echo "Zipping all the applications..."
find . -type d -iname 'kaamelott-soundboard-desktop-app*' -exec echo zip -r -9 -y zips/{}.zip {} \;

echo "OK ? Ctrl+C to cancel"
read || exit

find . -type d -iname 'kaamelott-soundboard-desktop-app*' -exec zip -r -9 -y zips/{}.zip {} \;
echo "DONE"
echo "Zipped all the applications in zips/ folder... :-)"
echo "Now, go to https://github.com/Naereen/kaamelott-soundboard-desktop-app/releases/edit/ and update the latest release..."