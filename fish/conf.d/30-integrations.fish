status is-interactive; or return

# Init scripts are cached by _cached_init to avoid a subprocess per tool.
if type -q zoxide
    source (_cached_init zoxide init fish --cmd j)
end

if type -q fzf
    set -lx FZF_CTRL_R_COMMAND
    source (_cached_init fzf --fish)
end

if type -q atuin
    set -gx ATUIN_NOBIND true
    source (_cached_init atuin init fish)
end
