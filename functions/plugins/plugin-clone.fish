function plugin-clone -a giturl -d "Clone a plugin"
    set plugin_name (string split / --max 1 --fields 2 --right $giturl)
    set plugin_name (string replace -r '\.git$' '' $plugin_name)
    set plugin_dir $__fish_config_dir/plugins/$plugin_name
    if ! test -d $plugin_dir
        command git clone --depth 1 --recursive --shallow-submodules $giturl $plugin_dir
        if test $status -ne 0
            echo "plugin-clone: git clone failed for: $giturl" >&2 && return 1
        end
    end
end
