# use emacs keymap - without this zsh picks vi mode because EDITOR=nvim,
# and opt-backspace (ESC+DEL) then drops into vi command mode
bindkey -e
bindkey '^[^?' backward-kill-word

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

