# Makefile to package Kaamelott-Soundbard desktop application for Linux
# See https://GitHub.com/Naereen/kaamelott-soundboard-desktop-app

# main rule : package and test locally
quick:	package test

all: 	package test install clean_app
all_and_clean: 	package test install clean_all

package:	install_deps
	electron-packager --overwrite ./

# Tests
localtest:	install_bower
	npm start

test:
	./kaamelott-soundboard-linux-x64/kaamelott-soundboard

test_app:
	kaamelott-soundboard


# Installers for dependencies
install_deps:	install_bower install_node

install_node:
	npm install

install_bower:
	bower install
	mv -vf ./bower_components ./js/


# Installer for the app
install_app:
	cp -vf ./img/ks.jpg ~/.local/share/applications/kaamelott-soundboard.jpg
	cp -rvf ./kaamelott-soundboard-linux-x64 ~/.local/share/
	ln -fs ~/.local/share/kaamelott-soundboard-linux-x64/kaamelott-soundboard ~/.local/bin/

validate_desktop_app:
	desktop-file-validate Kaamelott-Soundboard.desktop

register_app:	validate_desktop_app
	sudo desktop-file-install Kaamelott-Soundboard.desktop

install:	package install_app register_app


# Cleaners
clean_all:	clean clean_bower
clean:	clean_node clean_app clean_bower

clean_node:
	rm -rfv ./node_modules

clean_app:
	rm -rfv ./kaamelott-soundboard-linux-x64

clean_bower:
	rm -rfv ./js/bower_components
