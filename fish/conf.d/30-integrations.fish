status is-interactive; or return

if type -q zoxide
    zoxide init fish --cmd j | source
end

if type -q fzf
    set -lx FZF_CTRL_R_COMMAND
    fzf --fish | source
end

if type -q atuin
    set -gx ATUIN_NOBIND true
    atuin init fish | source
end
