TEMPLATES_DIR = /usr/local/share/templates/
LOCAL_TEMPLATES_DIR = ./src/templates

install: 
	npm link

	sudo find $(LOCAL_TEMPLATES_DIR) -type f -name "*.sh" -exec chmod +x {} \;
	sudo mkdir -p $(TEMPLATES_DIR)
	sudo cp -r ./src/templates/* $(TEMPLATES_DIR)

uninstall:
	npm unlink
	sudo rm -rf $(TEMPLATES_DIR)
