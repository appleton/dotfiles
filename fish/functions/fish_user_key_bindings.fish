function fish_user_key_bindings
    fish_default_key_bindings

    # Command-Right accepts the full suggestion; Option-Right stays wordwise.
    bind super-right end-of-line accept-autosuggestion
    bind \e\[1\;9C end-of-line accept-autosuggestion
    bind ctrl-e end-of-line accept-autosuggestion # Ghostty sends Ctrl-E.

    # Expand abbreviations only when the line is run, not while typing.
    bind space self-insert
    bind enter _expand_abbr_and_execute

    bind ctrl-u backward-kill-line
    bind alt-backspace backward-kill-word
    bind alt-delete backward-kill-word
    bind \e\x7f backward-kill-word
    bind \e\b backward-kill-word
    bind \e\[A history-prefix-search-backward
    bind \e\[B history-prefix-search-forward
    bind \eOA history-prefix-search-backward
    bind \eOB history-prefix-search-forward

    if functions -q _atuin_search
        bind \cr _atuin_search
    else
        bind \cr history-pager
    end
end
