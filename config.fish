# ~/.config/fish/conf.d runs first

# https://fishshell.com/docs/current/tutorial.html
# https://github.com/jorgebucaran/fish-shell-cookbook
# https://github.com/fish-shell/fish-shell/blob/master/share/config.fish
# https://github.com/fish-shell/fish-shell/blob/da32b6c172dcfe54c9dc4f19e46f35680fc8a91a/share/config.fish#L257-L269

#
# XDG
#

# Set XDG basedirs.
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -q XDG_CONFIG_HOME; or set -Ux XDG_CONFIG_HOME $HOME/.config
set -q XDG_DATA_HOME; or set -Ux XDG_DATA_HOME $HOME/.local/share
set -q XDG_CACHE_HOME; or set -Ux XDG_CACHE_HOME $HOME/.cache
set -q __fish_cache_dir; or set -Ux __fish_cache_dir $XDG_CACHE_HOME/fish
for xdgdir in $XDG_CONFIG_HOME $XDG_DATA_HOME $XDG_CACHE_HOME $__fish_cache_dir
    test -d $xdgdir; or mkdir -p $xdgdir
end

# Set app vars.
set -gx SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history
set -gx LESSHISTFILE $XDG_DATA_HOME/lesshst

#
# Homebrew
#

# Run 'brew shellenv | source' in reverse order.
set brewcmds (path filter /usr/local/bin/brew /opt/homebrew/bin/brew $HOME/brew/bin/brew)
for brewcmd in $brewcmds
    cachecmd $brewcmd shellenv | source
end
set -e brewcmds brewcmd

# Add keg-only apps
for app in ruby curl sqlite
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

#
# Environment
#

# Set editor variables.
set -gx PAGER less
set -gx VISUAL code
set -gx EDITOR vim

# Set browser on macOS.
switch (uname -s)
    case Darwin
        set -gx BROWSER open
end

#
# Fish
#

# Allow subdirs for functions and completions.
set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path
set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path

#
# Manuals
#

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

#
# Prompt
#

# Disable new user greeting.
set fish_greeting

# Initialize starship.
set -q STARSHIP_CONFIG; or set -gx STARSHIP_CONFIG $__fish_config_dir/themes/mmc.toml
cachecmd starship init fish | source
enable_transience

#
# Paths
#

# Initialize zoxide for fast jumping with 'z'.
cachecmd zoxide init fish | source

# Set vars for dotfiles.
set -q DOTFILES; or set -gx DOTFILES $XDG_CONFIG_HOME/dotfiles
set -q ZDOTDIR; or set -g ZDOTDIR $XDG_CONFIG_HOME/zsh

# Set initial working directory.
set -g IWD $PWD

# My special dirs
set -gx MY_PROJECTS $HOME/Projects
set -gx my_plugins_path $__fish_config_dir/plugins

# Add my bin directory to path.
fish_add_path --prepend $HOME/bin
