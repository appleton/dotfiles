DIR=~/.dotfiles

.PHONY: all install_packages symlinks fish

all: install_packages symlinks

symlinks: fish
	@mkdir -p ~/.config
	@ln -nsf $(DIR)/ghostty ~/.config/ghostty
	@ln -nsf $(DIR)/nvim ~/.config/nvim
	@ln -nsf $(DIR)/direnv ~/.config/direnv
	@ln -nsf $(DIR)/zshenv ~/.zshenv
	@ln -nsf $(DIR)/asdfrc ~/.asdfrc
	@ln -nsf $(DIR)/gitconfig ~/.gitconfig
	@ln -nsf $(DIR)/gitignore_global ~/.gitignore_global
	@ln -s $(DIR)/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	@ln -s $(DIR)/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
	@ln -s $(DIR)/vscode/snippets.code-snippets ~/Library/Application\ Support/Code/User/snippets
	@mkdir -p ~/.config/karabiner
	@ln -nsf $(DIR)/karabiner/karabiner.json ~/.config/karabiner/karabiner.json

fish:
	@mkdir -p "$(HOME)/.config"
	@target="$(HOME)/.config/fish"; source="$(CURDIR)/fish"; \
	if [ -L "$$target" ]; then \
		[ "$$(readlink "$$target")" = "$$source" ] || { echo "$$target points elsewhere; refusing to replace it" >&2; exit 1; }; \
	elif [ -e "$$target" ]; then \
		echo "$$target already exists; refusing to replace it" >&2; exit 1; \
	else \
		ln -s "$$source" "$$target"; \
	fi
	@if command -v fish >/dev/null 2>&1; then \
		data_home="$${XDG_DATA_HOME:-$(HOME)/.local/share}"; \
		plugin_config="$$data_home/fisher-config/fish"; \
		mkdir -p "$$plugin_config"; \
		cp "$(CURDIR)/fish/fish_plugins" "$$plugin_config/fish_plugins"; \
		HOME="$(HOME)" XDG_CONFIG_HOME="$$data_home/fisher-config" XDG_DATA_HOME="$$data_home" \
			fish -c 'set -g fisher_path $$XDG_DATA_HOME/fisher; if type -q fisher; and not test -f $$fisher_path/functions/_pure_prompt.fish; fisher update; end'; \
	fi

install_packages:
	brew bundle --file="$(CURDIR)/Brewfile"
