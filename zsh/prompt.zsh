fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

zstyle :prompt:pure:git:branch color yellow
zstyle :prompt:pure:git:dirty color yellow
