# Set up symlinks for dotfiles.
# Requires .dotfiles folder to be present in the home directory.
# `sh ~/.dotfiles/install.sh`

for file in zshenv jslintrc gitconfig tm_properties
do
  ln -s ~/.dotfiles/$file ~/.$file
  echo ">> symlinked ~/.dotfiles/$file to ~/.$file"
done

ln -s ~/.dotfiles/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings
echo ">> symlinked ~/.dotfiles/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings"

ln -s ~/.dotfiles/sublime/Markdown.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Markdown.sublime-settings
echo ">> symlinked ~/.dotfiles/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings"

ln -s ~/.dotfiles/sublime/Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Default\ \(OSX\).sublime-keymap
echo ">> symlinked ~/.dotfiles/sublime/Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Default\ \(OSX\).sublime-keymap"


echo "\n>> Done! Don't forget to reload your shell."
