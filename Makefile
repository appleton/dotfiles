DIR=~/.dotfiles

all: symlinks

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
