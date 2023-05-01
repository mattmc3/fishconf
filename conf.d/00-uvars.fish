#
# uvars - set fish universals
#

set -q MY_UVARS_SET
and return

# XDG base dirs
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -U XDG_CACHE_HOME $HOME/.cache
set -U XDG_CONFIG_HOME $HOME/.config
set -U XDG_DATA_HOME $HOME/.local/share
set -U XDG_STATE_HOME $HOME/.local/state
set -U XDG_RUNTIME_DIR $HOME/.xdg

for xdg_dir in \
    $XDG_CACHE_HOME \
    $XDG_CONFIG_HOME \
    $XDG_DATA_HOME \
    $XDG_STATE_HOME \
    $XDG_RUNTIME_DIR

    [ -d $xdg_dir ]; or mkdir -p $xdg_dir
end

# XDG apps
set -U SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history
set -U LESSHISTFILE $XDG_DATA_HOME/lesshst
set -U GNUPGHOME $XDG_DATA_HOME/gnupg

# Common shell variables
switch (uname -s)
    case Darwin
        set -U BROWSER open
end

set -U PAGER less
set -U VISUAL code
set -U EDITOR vim

# My special dirs
set -U MY_PROJECTS $HOME/Projects
set -U my_plugins_path $__fish_config_dir/plugins

# Man pages paths
if test (count $MANPATH) -eq 0
    set -U MANPATH /usr/local/share/man
else
    set -U MANPATH /usr/local/share/man $MANPATH
end

# We always want /usr/local/bin dirs, but on Apple Silicon we also need
# /opt/homebrew/bin dirs
fish_add_path /usr/local/bin /usr/local/sbin
if [ -e /opt/homebrew/bin/brew ]
    set -U HOMEBREW_PREFIX /opt/homebrew
    fish_add_path $HOMEBREW_PREFIX/bin $HOMEBREW_PREFIX/sbin
    set -U MANPATH $HOMEBREW_PREFIX/share/man $MANPATH
else if [ -e /usr/local/bin/brew ]
    set -U HOMEBREW_PREFIX /usr/local
end

# Other homebrew vars
set -U HOMEBREW_NO_ANALYTICS 1

# theme
set -U MY_THEME tokyonight_night

# Add my bin directory too.
fish_add_path ~/bin

set -U MY_UVARS_SET true
