# Set up symlinks for dotfiles.
# Requires .dotfiles folder to be present in the home directory.
# `sh ~/.dotfiles/install.sh`

for file in zshrc jslintrc gitconfig tm_properties
do
  ln -s ~/.dotfiles/$file ~/.$file
  echo ">> symlinked ~/.dotfiles/$file to ~/.$file"
done

echo "\n>> Done! Don't forget to reload your shell."
