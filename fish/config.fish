# Fish loads shared configuration from conf.d and functions automatically.
# Private settings can live in the ignored conf.d/secret.fish file.

set -g fish_greeting

if status is-interactive
    fish_user_key_bindings

    # Use a bar cursor with Fish's built-in cursor handling.
    set -g fish_cursor_default line
    fish_vi_cursor
end

# pnpm: global packages' bins. Appended, so mise's pinned pnpm comes first.
set -gx PNPM_HOME "/Users/andy/Library/pnpm"
fish_add_path --path --append $PNPM_HOME

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
