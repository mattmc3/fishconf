#
# env - set environment vars
#

# disable new user greeting
set fish_greeting

# dotfiles
set -q DOTFILES || set -gx DOTFILES ~/.config/dotfiles
set -q ZDOTDIR || set -gx ZDOTDIR ~/.config/zsh

# initial working directory
set -g IWD $PWD

# add function subdirs to fish_function_path
set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path

# add completion subdirs to fish_completion_path
set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path
