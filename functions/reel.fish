# http://github.com/mattmc3/reel
# Copyright mattmc3, 2020
# MIT license
set -g reel_version 0.0.1
set -g fish_config ~/.config/fish
set -g fish_plugins $fish_config/plugins

function reel --description 'The simple, elegant, clutter-free git plugin manager for the fish shell'
    argparse --stop-nonopt 'v/version' 'h/help' -- $argv

    if set -q _flag_version
        printf '%s\n' "reel, version $reel_version"
    else if set -q _flag_help
        _reel_usage
    else if functions --query _reel_cmd_$argv[1]
        _reel_cmd_$argv[1] $argv[2..-1]
    else
        _reel_usage
        return 1
    end
end

function _reel_usage
    set -l cmd (set_color $fish_color_command)
    set -l param (set_color $fish_color_param)
    set -l b (set_color --bold)
    set -l n (set_color normal)

    printf '%s\n' \
        "Usage:$cmd reel$n [options]$param command$n" \
        "" \
        "Options:" \
        "  -v --version  print reel version" \
        "  -h --help     print this help message" \
        "" \
        "Commands:" \
        "$b  ls$n                 list plugins" \
        "$b  in$n <plugins...>    initialize a plugin, download if necessary" \
        "$b  rm$n <plugins...>    remove an existing plugin" \
        "$b  up$n <plugins...>    update all plugins or just the specified plugin" \
        "$b  get$n <plugins...>   clone a plugin via git, but don't initialize it"
end

function _reel_error
    set -l _prefix (set_color --bold brred)'🎣 » error: '(set_color normal)
    printf '%s' "$_prefix" "$argv" \n
end

function _reel_print
    set -l _prefix (set_color --bold brgreen)'🎣 » '(set_color normal)
    printf '%s' "$_prefix" "$argv" \n
end

function _reel_warning
    set -l _prefix (set_color --bold bryellow)'🎣 » warning: '(set_color normal)
    printf '%s' "$_prefix" "$argv" \n
end

function _reel_giturl
    # try to parse a git URL
    set -l parsed (string match -r '^((?:https?|git|ssh):\/\/)(.+)\/([^\/]+)\/([^\/]+?)(?:.git)?$' $argv)
    or set -l parsed (string match -r '^(git@)(.+):([^\/]+)\/([^\/]+?)(?:.git)?$' $argv)
    or set -l parsed (string match -r '^([^\/]+)\/([^\/]+)$' $argv)

    if test (count $parsed) -eq 3
        set parsed "https://github.com/$parsed[2]/$parsed[3]" "https://" "github.com" $parsed[2..-1]
    else if test (count $parsed) -ne 5
        _reel_error "unable to parse git URL: $argv"
        return 1
    end

    # return the parsed URL as url, protocol, domain, user, and repo
    for item in $parsed
        echo $item
    end
end

function _reel_clone
    _reel_print "cloning repo $$argv[1]"
    command git clone --recursive --depth 1 $argv[1] "$argv[2]"
end

function _reel_cmd_ls
    for p in $fish_plugins/*/*
        string replace -a "$fish_plugins/" "" $p
    end
end

function _reel_cmd_in
    if test (count $argv) -eq 0
        _reel_error "expecting a plugin name"
        return 1
    end
    for p in $argv
        if not test -d "$fish_plugins/$p"
            set -l urlparts (_reel_giturl $p)
            if test $status -ne 0
                _reel_error "invalid plugin: $p"
                continue
            end
            set -l plugindir "$fish_plugins/$urlparts[4]/$urlparts[5]"
            if not test -d $plugindir
                _reel_print "Cloning repo $urlparts[1]"
                command git clone --recursive --depth 1 $urlparts[1] "$fish_plugins/$urlparts[4]/$urlparts[5]"
            end
        end
        if test -d "$fish_plugins/$p/completions"; and not contains "$fish_plugins/$p/completions" $fish_complete_path
            set fish_complete_path "$fish_plugins/$p/completions" $fish_complete_path
        end
        if test -d "$fish_plugins/$p/functions"; and not contains "$fish_plugins/$p/functions" $fish_function_path
            set fish_function_path "$fish_plugins/$p/functions" $fish_function_path
        end
        for f in "$fish_plugins/$p/conf.d"/*
            source "$f"
        end
    end
end

function _reel_cmd_get
    test (count $argv) -gt 0; or set argv (_reel_cmd_ls)
    for p in $argv
        set -l urlparts (_reel_giturl $p); or return 1
        set -l plugindir "$fish_plugins/$urlparts[4]/$urlparts[5]"
        if test -d $plugindir
            _reel_warning "plugin already exists"
        else
            _reel_clone $urlparts[1] "$plugindir"
        end
    end
end

function _reel_cmd_up
    test (count $argv) -gt 0; or set argv (_reel_cmd_ls)
    for p in $argv
        if not test -d "$fish_plugins/$p"
            _reel_error "plugin not found: $p"
        else
            _reel_print "updating plugin $p"
            command git -C "$fish_plugins/$p" pull --recurse-submodules origin
        end
    end
end

function _reel_cmd_rm
    if test (count $argv) -eq 0
        while true
            read -l -P "You are about to remove all your fish plugins. Are you sure [y/n]? " confirm
            switch $confirm
                case Y y
                    set argv (_reel_cmd_ls)
                    break
                case '' N n
                    return 1
                case
            end
        end
    end
    for p in $argv
        set plugin_path (realpath "$fish_plugins/$p")
        if not test -d "$plugin_path"
            _reel_error "plugin not found: $p"
        else if not _reel_is_rm_safe "$plugin_path"
            _reel_error "plugin path not removable: $p"
        else
            _reel_print "removing $plugin_path"
            command rm -rf "$plugin_path"
        end
    end
end

function _reel_is_rm_safe
    # do a small set of checks to make sure someone isn't being evil with
    # relative paths or accidentally gets burnt by a typo
    set -l path (realpath "$argv")
    if not string match -q -- "$HOME/*/*" $path
        return 1
    else if not test -d "$path/.git"
        return 1
    end
end
