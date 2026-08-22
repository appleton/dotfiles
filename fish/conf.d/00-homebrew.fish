if not set -q HOMEBREW_PREFIX
    for brew in /opt/homebrew/bin/brew /usr/local/bin/brew
        if test -x $brew
            $brew shellenv fish | source
            break
        end
    end
end
