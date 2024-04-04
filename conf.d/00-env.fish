#
# env - Set environment vars.
#

# Set XDG basedirs.
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -q XDG_CONFIG_HOME; or set -Ux XDG_CONFIG_HOME $HOME/.config
set -q XDG_DATA_HOME; or set -Ux XDG_DATA_HOME $HOME/.local/share
set -q XDG_STATE_HOME; or set -Ux XDG_STATE_HOME $HOME/.local/state
set -q XDG_CACHE_HOME; or set -Ux XDG_CACHE_HOME $HOME/.cache
mkdir -p $XDG_CONFIG_HOME $XDG_DATA_HOME $XDG_STATE_HOME $XDG_CACHE_HOME

# Fish vars
set -q __fish_cache_dir; or set -Ux __fish_cache_dir $XDG_CACHE_HOME/fish
set -q __fish_plugins_dir; or set -Ux __fish_plugins_dir $__fish_config_dir/plugins
test -d $__fish_cache_dir; or mkdir -p $__fish_cache_dir

# Set editor variables.
set -gx PAGER less
set -gx VISUAL code
set -gx EDITOR vim

# Set browser on macOS.
switch (uname -s)
    case Darwin
        set -gx BROWSER open
end

# Set vars for dotfiles and special dirs.
set -g ZDOTDIR $XDG_CONFIG_HOME/zsh
set -gx DOTFILES $HOME/.dotfiles
set -gx MY_PROJECTS $HOME/Projects

# Ensure manpath is set to something so we can add to it.
set -q MANPATH; or set -gx MANPATH ''

# Set initial working directory.
set -g IWD $PWD

# Other homebrew vars.
set -gx HOMEBREW_NO_ANALYTICS 1

# XDG apps
set -gx LESSHISTFILE $XDG_DATA_HOME/lesshst
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history
