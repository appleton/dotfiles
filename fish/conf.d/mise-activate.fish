# mise is installed to ~/.local/bin by https://mise.run (see `make mise`),
# which 10-environment.fish adds to PATH.

# Read .tool-versions plus the native version files used by Node, Ruby and Go.
set -gx MISE_IDIOMATIC_VERSION_FILE_ENABLE_TOOLS node,ruby,go,npm,pnpm

# Always activate: nested shells inherit MISE_SHELL but not mise's hooks.
if type -q mise
    mise activate fish | source
end
