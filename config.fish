# ~/.config/fish/conf.d runs first

# https://fishshell.com/docs/current/tutorial.html
# https://github.com/jorgebucaran/fish-shell-cookbook
# https://github.com/fish-shell/fish-shell/blob/master/share/config.fish
# https://github.com/fish-shell/fish-shell/blob/da32b6c172dcfe54c9dc4f19e46f35680fc8a91a/share/config.fish#L257-L269

#
# Env
#

# Set vars for dotfiles and special dirs.
set -g ZDOTDIR $XDG_CONFIG_HOME/zsh
set -gx DOTFILES $HOME/.dotfiles
set -gx MY_PROJECTS $HOME/Projects

# Set initial working directory.
set -g IWD $PWD

#
# Utils
#

# Initialize fuzzy finder.
if type -q fzf
    cachecmd fzf --fish | source
end

# Initialize zoxide for fast jumping with 'z'.
if type -q zoxide
    cachecmd zoxide init fish | source
end

#
# Prompt
#

# Disable new user greeting.
set fish_greeting

# Initialize starship.
if type -q starship
    set -gx STARSHIP_CONFIG $__fish_config_dir/themes/starship.toml
    cachecmd starship init fish | source
    enable_transience
end

#
# Theme
#

fish_config theme choose $FISH_THEME

#
# Terminal
#

# Set WezTerm title
if test -n "$TERM_PROGRAM"
    set_term_var TERM_CURRENT_SHELL "fish $FISH_VERSION"
end

#
# Local
#

if test -r $DOTFILES.local/fish/config.fish
    source $DOTFILES.local/fish/config.fish
end
