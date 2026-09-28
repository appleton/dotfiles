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

    # Generate the session ID with builtins; atuin's init would run `atuin uuid`.
    if not set -q ATUIN_SESSION; or test "$ATUIN_SHLVL" != "$SHLVL"
        set -gx ATUIN_SESSION (printf '%04x%04x%04x4%03x%x%03x%04x%04x%04x' \
            (random 0 65535) (random 0 65535) (random 0 65535) (random 0 4095) \
            (random 8 11) (random 0 4095) (random 0 65535) (random 0 65535) (random 0 65535))
        set -gx ATUIN_SHLVL $SHLVL
    end
    source (_cached_init atuin init fish)
end
