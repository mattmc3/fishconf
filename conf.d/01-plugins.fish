set -q fisher_path || set -Ux fisher_path $__fish_config_dir/.fisher
set -q my_plugins_path || set -Ux my_plugins_path $__fish_config_dir/plugins

if test "$fisher_paths_initialized" != true
    set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..]
    set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..]
    set -g fisher_paths_initialized true
end

if not test -d $fisher_path
    functions -e fisher &>/dev/null
    mkdir -p $fisher_path

    curl -sL https://git.io/fisher | source
    fisher install jorgebucaran/fisher
    fisher update
end

for file in $fisher_path/conf.d/*.fish
    if ! test -f $__fish_config_dir/conf.d/(path basename -- $file)
        and test -f $file && test -r $file
        builtin source $file
    end
end
