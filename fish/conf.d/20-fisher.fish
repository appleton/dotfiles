set -q XDG_DATA_HOME; or set -l XDG_DATA_HOME $HOME/.local/share
set -g fisher_path $XDG_DATA_HOME/fisher

set --prepend fish_function_path $fisher_path/functions
set --prepend fish_complete_path $fisher_path/completions

if test -d $fisher_path/conf.d
    for plugin_config in $fisher_path/conf.d/*.fish
        source $plugin_config
    end
end
