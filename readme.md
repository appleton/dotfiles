# Dotfiles

Install the Homebrew dependencies and VS Code extensions listed in `Brewfile`:

    make install_packages

This runs `brew bundle` using this repository's `Brewfile`.

Install mise to `~/.local/bin` with the official installer:

    make mise

Create the Fish symlink and install the Pure prompt:

    make fish

## ErgoDash function keys

The Karabiner configuration makes F1–F12 standard function keys on the ErgoDash
USB dongle (vendor 7504, product 24926), while keeping the laptop's normal media
and Mission Control keys. It also preserves Shift, Control, Option and Command
combinations and adapts to macOS's standard-function-key setting.

Install the Karabiner configuration with `make symlinks`. If an existing local
Karabiner configuration has other customisations, back it up and merge the
ErgoDash rule before replacing it.

Free F11 from macOS's global Show Desktop shortcut with:

    make macos-keyboard

This target is also included in `make all`. It changes only the Show Desktop
entry in the macOS shortcut preferences. The F11/Fn-F11 Show Desktop shortcut
is disabled for all keyboards; the laptop's volume and dedicated Mission
Control keys retain their normal behaviour. Log out and back in if macOS does
not pick up the change immediately. To undo it, enable Show Desktop in
System Settings → Keyboard → Keyboard Shortcuts → Mission Control.
