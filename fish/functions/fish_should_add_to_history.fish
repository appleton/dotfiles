function fish_should_add_to_history --description 'Skip private lines and expanded abbreviations'
    # Defining this function replaces fish's default of skipping lines that
    # start with a space, so keep doing that.
    string match -qr '^\s' -- $argv[1]; and return 1

    # _expand_abbr_and_execute already saved this line as typed.
    if set -q __abbr_skip_history
        set -e __abbr_skip_history
        return 1
    end
    return 0
end
