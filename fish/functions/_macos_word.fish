function _macos_word --description 'Move or delete by word using macOS word boundaries'
    # Usage: _macos_word backward|forward move|kill
    set -l direction $argv[1]
    set -l action $argv[2]
    set -l buffer "$(commandline -b)"
    set -l cursor (commandline -C)
    set -l len (string length -- $buffer)

    if test $action = move
        # Keep fish's extras: walk the directory history on an empty line, and
        # accept one word of the autosuggestion at the end of the line.
        if test $len -eq 0
            test $direction = backward
            and commandline -f prevd-or-backward-word
            or commandline -f nextd-or-forward-word
            return
        end
        if test $direction = forward -a $cursor -ge $len
            commandline -f forward-word
            return
        end
    end

    set -l target (_macos_word_target $direction $buffer $cursor)

    if test $action = move
        commandline -C $target
    else
        set -l from (math min $cursor, $target)
        set -l to (math max $cursor, $target)
        test $from -eq $to; and return
        set -l before (string sub -l $from -- $buffer)
        set -l after (string sub -s (math $to + 1) -- $buffer)
        commandline -r -- "$before$after"
        commandline -C $from
    end
end
