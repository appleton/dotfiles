DIR=~/.dotfiles

all: symlinks install_atom_packages

symlinks:
	@ln -nsf $(DIR)/zshenv ~/.zshenv
	@ln -nsf $(DIR)/vimrc ~/.vimrc
	@ln -nsf $(DIR)/jshintrc ~/.jshintrc
	@ln -nsf $(DIR)/nvmrc ~/.nvmrc
	@ln -nsf $(DIR)/gitconfig ~/.gitconfig
	@ln -nsf $(DIR)/gemrc ~/.gemrc
	@ln -nsf $(DIR)/bundle ~/.bundle
	@ln -nsf $(DIR)/gitignore_global ~/.gitignore_global
	@ln -nsf $(DIR)/sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
	@ln -nsf $(DIR)/atom ~/.atom
	@ln -s $(DIR)/zsh/theme.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup
	@ln -s $(DIR)/zsh/async.zsh /usr/local/share/zsh/site-functions/async
	@ln -s $(DIR)/hyper.js ~/.hyper.js

install_atom_packages:
	apm install --packages-file $(DIR)/atom/packages.txt

save_atom_packages:
	apm list --installed --bare > $(DIR)/atom/packages.txt
