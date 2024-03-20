#
# env - set environment vars
#

# Set XDG basedirs.
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set_xdg_basedirs

# Run 'brew shellenv | source' in order of preference.
for brew_prefix in \
    $HOME/.homebrew \
    /opt/homebrew \
    /usr/local

    if test -e "$brew_prefix/bin/brew"
        cachecmd "$brew_prefix/bin/brew" shellenv | source
        break
    end
end
set -e brew_prefix

# Add keg-only apps
for app in ruby curl sqlite
    if test -d "$HOMEBREW_PREFIX/opt/$app/bin"
        fish_add_path "$HOMEBREW_PREFIX/opt/$app/bin"
        set MANPATH "$HOMEBREW_PREFIX/opt/$app/share/man" $MANPATH
    end
end

# Add homebrew completions
if test -e "$HOMEBREW_PREFIX/share/fish/completions"
    set -a fish_complete_path "$HOMEBREW_PREFIX/share/fish/completions"
end

# Other homebrew vars.
set -gx HOMEBREW_NO_ANALYTICS 1

# Set editor variables.
set -gx PAGER less
set -gx VISUAL code
set -gx EDITOR vim

# Set browser on macOS.
switch (uname -s)
    case Darwin
        set -gx BROWSER open
end

# Set vars for dotfiles.
set -q DOTFILES; or set -gx DOTFILES $XDG_CONFIG_HOME/dotfiles
set -q ZDOTDIR; or set -g ZDOTDIR $XDG_CONFIG_HOME/zsh

# Set initial working directory.
set -g IWD $PWD

# Colorize man pages.
set -q LESS_TERMCAP_mb; or set -gx LESS_TERMCAP_mb (set_color -o blue)
set -q LESS_TERMCAP_md; or set -gx LESS_TERMCAP_md (set_color -o cyan)
set -q LESS_TERMCAP_me; or set -gx LESS_TERMCAP_me (set_color normal)
set -q LESS_TERMCAP_so; or set -gx LESS_TERMCAP_so (set_color -b white black)
set -q LESS_TERMCAP_se; or set -gx LESS_TERMCAP_se (set_color normal)
set -q LESS_TERMCAP_us; or set -gx LESS_TERMCAP_us (set_color -u magenta)
set -q LESS_TERMCAP_ue; or set -gx LESS_TERMCAP_ue (set_color normal)

# Add more man page paths.
set -q MANPATH; or set -gx MANPATH ''
for manpath in (path filter $__fish_data_dir/man /usr/local/share/man /usr/share/man)
    set -a MANPATH $manpath
end

# Allow subdirs for functions and completions.
set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path
set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path

# XDG apps
set -gx LESSHISTFILE $XDG_DATA_HOME/lesshst
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history

# My special dirs
set -gx MY_PROJECTS $HOME/Projects
set -gx my_plugins_path $__fish_config_dir/plugins

# Add bin directories to path.
fish_add_path --prepend $HOME/.local/bin
fish_add_path --prepend $HOME/bin
