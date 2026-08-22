function gb --description 'List recent branches or run git branch' --wraps='git branch'
    if test (count $argv) -eq 0
        command git recent
    else
        command git branch $argv
    end
end
