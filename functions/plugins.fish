function plugins -d "Manage your fish plugins the simple way"
    set -q fish_plugin_path; or set -gx fish_plugin_path $HOME/.config/fish/plugins

    set -l options 'h/help' 'x-verbose' 'l/load' 'q/query' 'u/update'
    set -l usage "usage: plugins $options"
    argparse --name=(status function) $options -- $argv

    if set -q _flag_help
        echo $usage
        return
    else if set -q _flag_query
        for plugin in $argv
            test -d "$fish_plugin_path/$plugin"; or return 1
        end
        return 0
    else if set -q _flag_update
        test (count $argv) -gt 0; or set argv (plugins)
        for p in $argv
            set -q _flag_verbose; and echo "Updating plugin: $p"
            git -C "$fish_plugin_path/$p" pull --recurse-submodules --quiet
        end
    else if set -q _flag_load
        # loading a plugin is simply adding it to $fish_complete_path,
        # $fish_function_path, and sourcing anything in conf.d
        test (count $argv) -gt 0; or set argv (plugins)
        for p in $argv
            set -l plugin "$fish_plugin_path/$p"
            if not test -d "$plugin"
                echo "Plugin not found: $p" >&2
                continue
            end
            set -q _flag_verbose; and echo "Loading plugin: $p"
            if test -d "$plugin/completions"; and not contains "$plugin/completions" $fish_complete_path
                set fish_complete_path "$plugin/completions" $fish_complete_path
            end
            if test -d "$plugin/functions"; and not contains "$plugin/functions" $fish_function_path
                set fish_function_path "$plugin/functions" $fish_function_path
            end
            for f in "$plugin/conf.d"/*.fish
                source "$f"
            end
        end
    else
        # list plugins
        for p in $fish_plugin_path/*/*
            string replace -a "$fish_plugin_path/" "" $p
        end
    end
end
