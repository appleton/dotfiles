# Dotfiles

Install the Homebrew dependencies and VS Code extensions listed in `Brewfile`:

    make install_packages

This runs `brew bundle` using this repository's `Brewfile`.

Create the Fish symlink and install the Pure prompt:

    make fish

Try Fish without changing the login shell:

    fish

Zsh remains available, and the login shell is not changed.
