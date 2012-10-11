# Set up symlinks for dotfiles.
# Requires .dotfiles folder to be present in the home directory.
# `sh ~/.dotfiles/install.sh`

for file in zshenv jslintrc gitconfig tm_properties gemrc
do
  ln -s ~/.dotfiles/$file ~/.$file
  echo ">> symlinked ~/.dotfiles/$file to ~/.$file"
done

for path in ~/.dotfiles/sublime/*
do
  file=$(basename $path)
  ln -s $path ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/$file
  echo ">> symlinked $path to ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/$file"
done

echo "\n>> Done! Don't forget to reload your shell."
