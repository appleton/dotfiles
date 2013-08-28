# Set up symlinks for dotfiles.
# Requires .dotfiles folder to be present in the home directory.
# `sh ~/.dotfiles/install.sh`

for file in zshenv jshintrc gitconfig tm_properties gemrc bundle gitignore_global
do
  ln -s ~/.dotfiles/$file ~/.$file
  echo ">> symlinked ~/.dotfiles/$file to ~/.$file"
done

ln -s ~/.dotfiles/sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages

echo "\n>> Done! Don't forget to reload your shell."
