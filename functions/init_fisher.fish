#
# Setup Fisher for plugins.
#
function init_fisher
    set -q fisher_path || set -gx fisher_path $__fish_config_dir/.fisher
    set -q my_plugins_path || set -gx my_plugins_path $__fish_config_dir/plugins

    if test "$fisher_paths_initialized" != true
        set --local idx (contains -i $__fish_config_dir/functions $fish_function_path || echo 1)
        set fish_function_path $fish_function_path[1..$idx] $fisher_path/functions $fish_function_path[(math $idx + 1)..]

        set --local idx (contains -i $__fish_config_dir/completions $fish_complete_path || echo 1)
        set fish_complete_path $fish_complete_path[1..$idx] $fisher_path/completions $fish_complete_path[(math $idx + 1)..]

        set -g fisher_paths_initialized true
    end

    if not test -d $fisher_path
        functions -e fisher &>/dev/null
        mkdir -p $fisher_path
        touch $__fish_config_dir/fish_plugins
        curl -sL https://git.io/fisher | source
        if test -s $__fish_config_dir/fish_plugins
            fisher update
        else
            fisher install jorgebucaran/fisher
        end
    end

    for file in $fisher_path/conf.d/*.fish
        if ! test -f $__fish_config_dir/conf.d/(path basename -- $file)
            and test -f $file && test -r $file
            builtin source $file
        end
    end
end
