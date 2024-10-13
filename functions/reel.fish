# Reel - a simple Fish plugin manager

# Setup Reel
set -q reel_path || set -gx reel_path $__fish_config_dir/.reel

function __reel_update -a repo
    set --local plugindir $reel_path/plugins/(path basename $repo)
    set --local oldsha (command git -C $plugindir rev-parse --short HEAD)
    command git -C $plugindir pull --quiet --ff --depth 1 --rebase --autostash
    set --local newsha (command git -C $plugindir rev-parse --short HEAD)
    if test $oldsha != $newsha
        echo "Repo updated: "(path basename $plugindir)" ($oldsha->$newsha)"
    end
end

function __reel_plugin_repo -a plugindir
    set --local url_parts (
        command git -C $plugindir config remote.origin.url |
        string replace ':' '/' |
        string split '/'
    )
    echo $url_parts[-2]"/"$url_parts[-1]
end

function reel -a cmd --description "A simple Fish plugin manager"
    # reel main function
    set argv $argv[2..-1]

    # piped/redirected input
    if not test -t 0
        while read -l line
            set line (string replace -r '#.*$' "" $line | string trim)
            if [ $line != "" ]
                set argv $argv $line
            end
        end
    end

    switch "$cmd"
        case home
            echo $reel_path
        case ls
            for plugindir in (path dirname $reel_path/plugins/*/.git)
                __reel_plugin_repo $plugindir
            end
        case up
            echo "Checking for updates..."
            for repo in (reel ls)
                echo "$repo..."
                __reel_update $repo &
            end
            wait
            echo "Update complete."
        case rm
            set err 0
            for repo in $argv
                if not string match --quiet "$HOME/*" "$reel_path"
                    echo >&2 "reel: 'reel_path' not set correctly '$reel_path'."
                    return 1
                else if [ -d $reel_path/plugins/(path basename $repo) ]
                    command rm -rf -- $reel_path/plugins/(path basename $repo)
                else
                    echo "Repo not found '$repo'."
                    set err 1
                end
            end
            return $err
        case in
            set err 1
            for repo in $argv
                set --local plugindir $reel_path/plugins/(path basename $repo)
                if not test -d $plugindir
                    echo "Cloning $repo..."
                    command git clone --quiet --depth 1 --recursive --shallow-submodules \
                        https://github.com/$repo $plugindir &
                    set err 0
                end
            end
            wait
            return $err
        case init
            if test "$reel_paths_initialized" != true
                set fish_function_path $fish_function_path[1] $reel_path/functions $fish_function_path[2..]
                set fish_complete_path $fish_complete_path[1] $reel_path/completions $fish_complete_path[2..]
                set -g reel_paths_initialized true
            end

            for file in $reel_path/conf.d/*.fish
                if ! test -f $__fish_config_dir/conf.d/(path basename -- $file)
                    and test -f $file && test -r $file
                    builtin source $file
                end
            end
        case \*
            echo >&2 "reel: unknown command '"$cmd"'"
            return 1
    end
end
