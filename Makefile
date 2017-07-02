all:	package test

start:
	npm start

package:	install_node
	electron-packager --overwrite .

test:
	./kaamelott-soundboard-linux-x64/kaamelott-soundboard

install_node:
	npm install
