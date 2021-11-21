### plugins
set -q GIT_PLUGIN_LOCATION; or set -U GIT_PLUGIN_LOCATION "git@github.com:"
set plugins (cat $__fish_config_dir/fish_plugins)

# clone plugins
for repo in $plugins
    set plugin_name (string split / --max 1 --fields 2 --right $repo)
    set plugin_dir $__fish_config_dir/plugins/$plugin_name
    if ! test -d $plugin_dir
        command git clone --depth 1 --recursive --shallow-submodules $GIT_PLUGIN_LOCATION$repo $plugin_dir
        if test $status -ne 0
            echo "git clone failed for: $repo" >&2
            continue
        end
        if test -d $plugin_dir/completions; and not contains $plugin_dir/completions $plugin_complete_path
            set -U plugin_complete_path $plugin_complete_path $plugin_dir/completions
        end
        if test -d $plugin_dir/functions; and not contains $plugin_dir/functions $plugin_function_path
            set -U plugin_function_path $plugin_function_path $plugin_dir/functions
        end
        if test -d $plugin_dir/conf.d; and not contains $plugin_dir/conf.d $plugin_confd_path
            set -U plugin_confd_path $plugin_confd_path $plugin_dir/conf.d
        end
    end
end

# load plugins
set fish_complete_path $fish_complete_path[1] $plugin_complete_path $fish_complete_path[2..-1]
set fish_function_path $fish_function_path[1] $plugin_function_path $fish_function_path[2..-1]
for confd in $plugin_confd_path
    for f in $confd/*.fish
        builtin source "$f"
    end
end
