# Fish loads shared configuration from conf.d and functions automatically.
# Private settings can live in the ignored conf.d/secret.fish file.

set -g fish_greeting

if status is-interactive
    fish_user_key_bindings
end
