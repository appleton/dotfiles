DIR=~/.dotfiles

all: install_packages symlinks install_vscode_packages configure_iterm

symlinks:
	@mkdir ~/.config
	@ln -nsf $(DIR)/nvim ~/.config/nvim
	@ln -nsf $(DIR)/zshenv ~/.zshenv
	@ln -nsf $(DIR)/asdfrc ~/.asdfrc
	@ln -nsf $(DIR)/gitconfig ~/.gitconfig
	@ln -nsf $(DIR)/gemrc ~/.gemrc
	@ln -nsf $(DIR)/bundle ~/.bundle
	@ln -nsf $(DIR)/gitignore_global ~/.gitignore_global
	@ln -s $(DIR)/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	@ln -s $(DIR)/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
	@ln -s $(DIR)/vscode/snippets.code-snippets ~/Library/Application\ Support/Code/User/snippets

install_packages:
	brew install direnv asdf nvim homebrew/cask-fonts/font-hack zsh-autosuggestions git

install_vscode_packages:
	$(DIR)/vscode/install_vscode_packages

save_vscode_packages:
	code --list-extensions > $(DIR)/vscode/extensions.txt

configure_iterm:
	defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string $(DIR)/iterm2
	defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
