set -q DOTFILES; or set -gx DOTFILES ~/.config/dotfiles

# no greeting
set fish_greeting

# apps
set -q PAGER; or set -gx PAGER less
set -q VISUAL; or set -gx VISUAL code
set -q EDITOR; or set -gx EDITOR vim

# my vars
set -q PROJECTS; or set -x PROJECTS ~/Projects

# path
# http://fishshell.com/docs/current/tutorial.html#tut_path
set fish_function_path $HOME/bin $fish_function_path

set -gx PATH $HOME/bin $PATH $XDG_DATA_HOME/npm/bin
