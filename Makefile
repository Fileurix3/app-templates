TEMPLATES_DIR = /usr/local/share/templates/

install: 
	npm link

	sudo mkdir -p $(TEMPLATES_DIR)
	sudo cp -r ./src/templates/* $(TEMPLATES_DIR)

uninstall:
	npm unlink
	sudo rm -rf $(TEMPLATES_DIR)
