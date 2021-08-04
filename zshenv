# .zshenv - sourced for all shells
setopt no_global_rcs
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
export PATH=$HOME/bin:$HOME/.dotfiles/bin:$PATH

# npm executables
export PATH=node_modules/.bin:/usr/local/share/npm/bin:$PATH

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export GPG_TTY=$(tty)

for config_file ($HOME/.dotfiles/zsh/*.zsh) source $config_file
source $HOME/.dotfiles/zsh/autosuggestions/zsh-autosuggestions.zsh
