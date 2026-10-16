function _expand_abbr_and_execute --description 'Expand the command abbreviation, then run the line'
    if commandline --paging-mode
        commandline -f execute
        return
    end

    # Move the cursor to the end of the first word so expand-abbr sees it,
    # even when arguments follow (e.g. `gco main`).
    set -l first (string match -r '^\s*[^\s;|&]+' -- (commandline | string collect))
    if test -n "$first"
        commandline -C (string length -- $first)
        commandline -f expand-abbr
    end
    # Drop any autosuggestion first: end-of-buffer accepts it when the cursor
    # is already at the end, which would run the suggestion instead.
    commandline -f suppress-autosuggestion end-of-buffer execute
end
