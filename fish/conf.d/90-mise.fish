# Read .tool-versions plus the native version files used by Node, Ruby and Go.
set -gx MISE_IDIOMATIC_VERSION_FILE_ENABLE_TOOLS node,ruby,go,npm,pnpm

if type -q mise; and not set -q MISE_SHELL
    mise activate fish | source
end
