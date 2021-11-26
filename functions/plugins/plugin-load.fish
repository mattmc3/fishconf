function plugin-load -a plugin_dir -d "Load a plugin"
    if not test -d "$plugin_dir"
        echo >&2 "plugin-load: Plugin directory not found: '$plugin_dir'."
        return 1
    end
    test -d $plugin_dir/completions; and set fish_complete_path $fish_complete_path[1] $plugin_dir/completions $fish_complete_path[2..-1]
    test -d $plugin_dir/functions; and set fish_function_path $fish_function_path[1] $plugin_dir/functions $fish_function_path[2..-1]
    test -f $plugin_dir/config.fish; and builtin source "$plugin_dir/config.fish"
    for conffile in $plugin_dir/conf.d/*
        builtin source "$conffile"
    end
end
