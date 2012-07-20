# Set up symlinks for dotfiles.
# Requires .dotfiles folder to be present in the home directory.
# `sh ~/.dotfiles/install.sh`

for file in zshenv jslintrc gitconfig tm_properties
do
  ln -s ~/.dotfiles/$file ~/.$file
  echo ">> symlinked ~/.dotfiles/$file to ~/.$file"
done

for file in Preferences.sublime-settings Default\ \(OSX\).sublime-keymap
do
  ln -s ~/.dotfiles/sublime/$file ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/$file
  echo ">> symlinked ~/.dotfiles/sublime/$file ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/$file"
done

echo "\n>> Done! Don't forget to reload your shell."
