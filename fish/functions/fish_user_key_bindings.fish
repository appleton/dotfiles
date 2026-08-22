function fish_user_key_bindings
    fish_default_key_bindings

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
