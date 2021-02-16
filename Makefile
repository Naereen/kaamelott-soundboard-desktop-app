# Makefile to package Kaamelott-Soundbard desktop application for Linux
# See https://GitHub.com/Naereen/kaamelott-soundboard-desktop-app

# main rule : package and test locally
quick:	package test

all: 	package test install clean_app
all_and_clean: 	package test install clean_all

package:	install_deps
	electron-packager --no-prune --overwrite ./

package_all:	install_deps
	electron-packager --all --no-prune --overwrite ./

zip_all:
	./zipall.sh

# Tests
localtest:	install_bower
	npm start

test:
	./kaamelott-soundboard-desktop-app-linux-x64/kaamelott-soundboard-desktop-app

test_app:
	kaamelott-soundboard-desktop-app


# Installers for dependencies
install_node_npm:
	sudo apt install nodejs npm
	sudo npm install -g electron electron-packager
	# npm install electron electron-packager

install_deps:	install_bower install_node

install_node:
	npm install

install_bower:
	-mv -vf ./js/bower_components /tmp/
	bower install
	-mv -vf ./bower_components ./js/


# Installer for the app
install_app:
	cp -vf ./img/ks.jpg ~/.local/share/applications/kaamelott-soundboard.jpg
	cp -rvf ./kaamelott-soundboard-desktop-app-linux-x64 ~/.local/share/
	ln -fs ~/.local/share/kaamelott-soundboard-desktop-app-linux-x64/kaamelott-soundboard-desktop-app ~/.local/bin/

validate_desktop_app:
	desktop-file-validate Kaamelott-Soundboard.desktop

register_app:	validate_desktop_app
	sudo desktop-file-install Kaamelott-Soundboard.desktop

install:	package install_app register_app


# Cleaners
clean_all:	clean clean_bower clean_zip
clean:	clean_node clean_app clean_bower

clean_node:
	rm -rfv ./node_modules

clean_zip:
	rm -rfv ./zips/*.zip

clean_app:
	rm -rfv ./kaamelott-soundboard-linux-x64
	rm -rfv ./kaamelott-soundboard-desktop-app-linux-x64

clean_bower:
	rm -rfv ./js/bower_components
