. "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

export ASDF_GOLANG_MOD_VERSION_ENABLED=true
