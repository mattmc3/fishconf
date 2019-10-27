set -q DOTFILES; or set -gx DOTFILES ~/.config/dotfiles

# no greeting
set fish_greeting

# apps
set -q PAGER; or set -gx PAGER less
set -q VISUAL; or set -gx VISUAL code
set -q EDITOR; or set -gx EDITOR vim

# my vars
set -q MY_PROJECTS_DIR; or set -x MY_PROJECTS_DIR ~/Projects

# path
# http://fishshell.com/docs/current/tutorial.html#tut_path
set fish_function_path $HOME/bin $fish_function_path

set -gx PATH $PATH $XDG_DATA_HOME/npm/bin
