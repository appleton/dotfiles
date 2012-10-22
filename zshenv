# .zshenv - sourced for all shells
export PATH=/usr/local/share/npm/bin:$HOME/bin:$HOME/.dotfiles/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

for config_file ($HOME/.dotfiles/zsh/*.zsh) source $config_file
