set -gx LANG en_US.UTF8
set -gx LC_ALL en_US.UTF-8
set -gx EDITOR nvim
set -gx VISUAL nvim

fish_add_path --global --move \
    $HOME/bin \
    $HOME/.dotfiles/bin \
    $HOME/.local/bin \
    $HOME/.cargo/bin \
    $HOME/.sentry/bin \
    /Applications/Postgres.app/Contents/Versions/latest/bin

if status is-interactive
    if tty >/dev/null 2>&1
        set -gx GPG_TTY (tty)
    end
end
