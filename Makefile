DIR=~/.dotfiles

all: install_packages symlinks install_vscode_packages configure_iterm

symlinks:
	@ln -nsf $(DIR)/zshenv ~/.zshenv
	@ln -nsf $(DIR)/asdfrc ~/.asdfrc
	@ln -nsf $(DIR)/vimrc ~/.vimrc
	@ln -nsf $(DIR)/gitconfig ~/.gitconfig
	@ln -nsf $(DIR)/gemrc ~/.gemrc
	@ln -nsf $(DIR)/bundle ~/.bundle
	@ln -nsf $(DIR)/gitignore_global ~/.gitignore_global
	@ln -s $(DIR)/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	@ln -s $(DIR)/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
	@ln -s $(DIR)/vscode/snippets ~/Library/Application\ Support/Code/User/snippets
	@ln -s $(DIR)/vscode/custom.js  ~/Library/Application\ Support/Code/User/globalStorage/iocave.monkey-patch/modules/custom.js
	@ln -s $(DIR)/vscode/custom.css  ~/Library/Application\ Support/Code/User/globalStorage/iocave.monkey-patch/modules/custom.css

install_packages:
	brew install direnv asdf vim

install_vscode_packages:
	$(DIR)/vscode/install_vscode_packages

save_vscode_packages:
	code --list-extensions > $(DIR)/vscode/extensions.txt

configure_iterm:
	defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string $(DIR)/iterm2
	defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
