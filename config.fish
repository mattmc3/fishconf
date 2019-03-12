# config.fish isn't like zshrc/bashrc - not everything should be done here.
# ~/.config/fish/conf.d runs first

# https://fishshell.com/docs/current/tutorial.html
# https://github.com/jorgebucaran/fish-shell-cookbook
# https://github.com/fish-shell/fish-shell/blob/master/share/config.fish

set -q DOTFILES; or set -gx DOTFILES ~/.config/dotfiles

# no greeting
set fish_greeting

# apps
set -q PAGER; or set -gx PAGER less
set -q VISUAL; or set -gx VISUAL code
set -q EDITOR; or set -gx EDITOR nvim

# my vars
set -q MY_PROJECTS_DIR; or set -x MY_PROJECTS_DIR ~/Projects

# path
# http://fishshell.com/docs/current/tutorial.html#tut_path
set fish_function_path $HOME/bin $fish_function_path

# local overrides {{{
set fish_function_path $DOTFILES.local/fish/functions.local $fish_function_path
[ -f $DOTFILES.local/fish/config.local.fish ] ;and source $DOTFILES.local/fish/config.local.fish
# }}}
