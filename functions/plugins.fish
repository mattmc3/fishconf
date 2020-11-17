function plugins -d "Manage fish plugins"
    set -q fish_plugin_path; or set -gx fish_plugin_path $HOME/.config/fish/plugins

    set -l options 'h/help' 'i/init'
    set -l usage "usage: "(status function)" $options"
    argparse --name=(status function) $options -- $argv

    if set -q _flag_help
        echo $usage
        return
    else if set -q _flag_init
        # initializing a plugin is simply adding it to $fish_complete_path,
        # $fish_function_path, and sourcing anything in conf.d
        for plugin_path in $fish_plugin_path
            for plugin in $plugin_path/*/*
                if test -d "$plugin/completions"; and not contains "$plugin/completions" $fish_complete_path
                    set fish_complete_path "$plugin/completions" $fish_complete_path
                end
                if test -d "$plugin/functions"; and not contains "$plugin/functions" $fish_function_path
                    set fish_function_path "$plugin/functions" $fish_function_path
                end
                for f in "$plugin/conf.d"/*
                    source "$f"
                end
            end
        end
    else
        # list plugins
        for plugin_path in $fish_plugin_path
            for plugin in $plugin_path/*/*
                echo $plugin
            end
        end
    end
end
