function _expand_abbr_and_execute --description 'Expand the command abbreviation, then run the line'
    if commandline --paging-mode
        commandline -f execute
        return
    end

    # Move the cursor to the end of the first word so expand-abbr sees it,
    # even when arguments follow (e.g. `gco main`).
    set -l typed (commandline | string collect)
    set -l first (string match -r '^\s*[^\s;|&]+' -- $typed)
    if test -n "$first"
        commandline -C (string length -- $first)
        commandline -f expand-abbr
        # Record the line as typed instead of expanded, so autosuggestions
        # match the abbreviation (e.g. `gp --force-with-lease`) next time.
        # fish_should_add_to_history skips the expanded copy. Lines starting
        # with a space are kept out of history, as fish does.
        if abbr --query -- $first
            and commandline --is-valid
            and not string match -qr '^\s' -- $typed
            history append -- $typed
            set -g __abbr_skip_history 1
        end
    end
    # Drop any autosuggestion first: end-of-buffer accepts it when the cursor
    # is already at the end, which would run the suggestion instead.
    commandline -f suppress-autosuggestion end-of-buffer execute
end
