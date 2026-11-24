function _macos_word_target --description 'Print the macOS-style word boundary before or after a cursor position'
    # Usage: _macos_word_target backward|forward BUFFER CURSOR
    set -l direction $argv[1]
    set -l buffer $argv[2]
    set -l cursor $argv[3]

    # Unicode (UAX #29) words as macOS sees them: runs of letters, digits and
    # underscores, joined across . and ' between letters or digits, and across
    # , and ; between digits. So foo.bar, don't, foo_bar and 1,000.5 are single
    # words, while - / : and spaces separate words.
    set -l w '[\p{L}\p{N}\p{M}_]'
    set -l re "$w+(?:(?:(?<=\p{L})[.'’](?=\p{L})|(?<=\p{N})[.,;'’](?=\p{N}))$w+)*"

    if test "$direction" = backward
        set -l target 0
        for m in (string match -ra --index -- $re $buffer)
            set -l start (math (string split ' ' -- $m)[1] - 1)
            test $start -lt $cursor; or break
            set target $start
        end
        echo $target
    else
        for m in (string match -ra --index -- $re $buffer)
            set -l parts (string split ' ' -- $m)
            set -l end (math $parts[1] - 1 + $parts[2])
            if test $end -gt $cursor
                echo $end
                return
            end
        end
        string length -- $buffer
    end
end
