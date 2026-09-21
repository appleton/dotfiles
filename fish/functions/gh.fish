function gh --description 'Browse the current repository or run GitHub CLI' --wraps=gh
    if test (count $argv) -eq 0
        command gh browse
    else
        command gh $argv
    end
end
