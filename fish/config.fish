# Fish loads shared configuration from conf.d and functions automatically.
# Private settings can live in the ignored conf.d/secret.fish file.

set -g fish_greeting

if status is-interactive
    fish_user_key_bindings

    # Use a bar cursor with Fish's built-in cursor handling.
    set -g fish_cursor_default line
    fish_vi_cursor
end

# pnpm
set -gx PNPM_HOME "/Users/andy/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
