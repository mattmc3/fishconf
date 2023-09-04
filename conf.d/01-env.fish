#
# env - set environment vars
#

# XDG
if not set -q XDG_BASEDIRS_SET
    set_xdg_basedirs
    set -Ux XDG_BASEDIRS_SET true
end

# homebrew
if test -e ~/brew/bin/brew
    set -gx HOMEBREW_PREFIX $HOME/brew
    fish_add_path -p /opt/homebrew/bin
    eval ($HOMEBREW_PREFIX/bin/brew shellenv)
else if test -e /opt/homebrew/bin/brew
    set -gx HOMEBREW_PREFIX /opt/homebrew
    eval ($HOMEBREW_PREFIX/bin/brew shellenv)
end

# Add keg-only apps
for app in ruby curl
    if test -d $HOMEBREW_PREFIX/opt/$app/bin
        fish_add_path $HOMEBREW_PREFIX/opt/$app/bin
        set MANPATH $HOMEBREW_PREFIX/opt/$app/share/man $MANPATH
    end
end

# Add homebrew completions
if test -e $HOMEBREW_PREFIX/share/fish/completions
    set -a fish_complete_path $HOMEBREW_PREFIX/share/fish/completions
end

# Other homebrew vars
set -gx HOMEBREW_NO_ANALYTICS 1

# disable new user greeting
set fish_greeting

# Editor variables
set -gx PAGER less
set -gx VISUAL code
set -gx EDITOR vim

# Browser
switch (uname -s)
    case Darwin
        set -gx BROWSER open
end

# dotfiles
set -q DOTFILES || set -gx DOTFILES ~/.config/dotfiles
set -q ZDOTDIR || set -g ZDOTDIR ~/.config/zsh

# initial working directory
set -g IWD $PWD

# add function subdirs to fish_function_path
set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path

# add completion subdirs to fish_completion_path
set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path

# Man pages paths
set -q MANPATH || set -gx MANPATH ''
for manpath in
    $__fish_data_dir/man \
        /opt/homebrew/share/man \
        /usr/local/share/man \
        /usr/share/man

    test -d $manpath && set -a MANPATH $manpath
end

# sqlite
fish_add_path -a $HOMEBREW_PREFIX/opt/sqlite/bin
set -gx SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history

# XDG apps
set -gx LESSHISTFILE $XDG_DATA_HOME/lesshst
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg

# My special dirs
set -gx MY_PROJECTS $HOME/Projects
set -gx my_plugins_path $__fish_config_dir/plugins

# Reel plugins
set -gx REEL_HOME $XDG_DATA_HOME/reel

# Add my bin directory to path.
fish_add_path --append ~/bin
