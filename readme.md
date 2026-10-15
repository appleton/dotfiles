# Dotfiles

Install the Homebrew dependencies and VS Code extensions listed in `Brewfile`:

    make install_packages

This runs `brew bundle` using this repository's `Brewfile`.

Install mise to `~/.local/bin` with the official installer:

    make mise

Create the Fish symlink and install the Pure prompt:

    make fish
