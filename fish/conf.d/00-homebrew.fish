# Equivalent to `brew shellenv fish`, without spawning Ruby on every shell start.
if not set -q HOMEBREW_PREFIX
    for prefix in /opt/homebrew /usr/local
        if test -x $prefix/bin/brew
            set -gx HOMEBREW_PREFIX $prefix
            set -gx HOMEBREW_CELLAR $prefix/Cellar
            set -gx HOMEBREW_REPOSITORY $prefix
            test $prefix = /usr/local; and set HOMEBREW_REPOSITORY $prefix/Homebrew
            fish_add_path --global --move --path $prefix/bin $prefix/sbin
            if test -n "$MANPATH"
                set -gx MANPATH (string replace --regex '^:*(.*?):*$' ':$1' -- "$MANPATH")
            end
            set -q INFOPATH; or set INFOPATH ''
            set -gx INFOPATH $prefix/share/info $INFOPATH
            break
        end
    end
end
