set -q DOTFILES || set -gx DOTFILES ~/.config/dotfiles

# no greeting
set fish_greeting

# apps
set -q PAGER || set -gx PAGER less
set -q VISUAL || set -gx VISUAL code
set -q EDITOR || set -gx EDITOR vim

# my vars
set -q MY_PROJECTS_DIR || set -x MY_PROJECTS_DIR ~/Projects

# path
# http://fishshell.com/docs/current/tutorial.html#tut_path
set fish_function_path $HOME/bin $fish_function_path

set -gx PATH $HOME/bin $PATH $XDG_DATA_HOME/npm/bin
