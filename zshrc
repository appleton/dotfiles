# TextMate 2 as editor
export EDITOR="$HOME/bin/mate -w"

# Load RVM
[[ -s "/Users/andy/.rvm/scripts/rvm" ]] && source "/Users/andy/.rvm/scripts/rvm"

# oh-my-zsh
ZSH=$HOME/.dotfiles/oh-my-zsh
ZSH_THEME="andy"

# oh-my-zsh plugins
plugins=(git npm bundler)

source $ZSH/oh-my-zsh.sh

# z is the new j - https://github.com/rupa/z
source $HOME/.dotfiles/oh-my-zsh/custom/z/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

# SSH to webfaction with rmate
alias ssha="ssh -R 52698:localhost:52698 appleton@appleton.webfactional.com"

