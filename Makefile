DIR=~/.dotfiles

all: install_asdf symlinks install_atom_packages install_vscode_packages configure_iterm

symlinks:
	@ln -nsf $(DIR)/zshenv ~/.zshenv
	@ln -nsf $(DIR)/asdfrc ~/.asdfrc
	@ln -nsf $(DIR)/vimrc ~/.vimrc
	@ln -nsf $(DIR)/jshintrc ~/.jshintrc
	@ln -nsf $(DIR)/nvmrc ~/.nvmrc
	@ln -nsf $(DIR)/gitconfig ~/.gitconfig
	@ln -nsf $(DIR)/gemrc ~/.gemrc
	@ln -nsf $(DIR)/bundle ~/.bundle
	@ln -nsf $(DIR)/gitignore_global ~/.gitignore_global
	@ln -nsf $(DIR)/atom ~/.atom
	@ln -s $(DIR)/zsh/theme.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup
	@ln -s $(DIR)/zsh/async.zsh /usr/local/share/zsh/site-functions/async
	@ln -s $(DIR)/hyper.js ~/.hyper.js
	@ln -s $(DIR)/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	@ln -s $(DIR)/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
	@ln -s $(DIR)/vscode/snippets ~/Library/Application\ Support/Code/User/snippets

install_asdf:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf
	cd ~/.asdf
	git checkout "$(git describe --abbrev=0 --tags)"

install_atom_packages:
	apm install --packages-file $(DIR)/atom/packages.txt

save_atom_packages:
	apm list --installed --bare > $(DIR)/atom/packages.txt

install_vscode_packages:
	$(DIR)/vscode/install_vscode_packages

save_vscode_packages:
	code --list-extensions > $(DIR)/vscode/extensions.txt

configure_iterm:
	defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string $(DIR)/iterm2
	defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
