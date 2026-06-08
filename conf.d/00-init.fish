# init: runs before every other conf.d file (the 00- prefix wins the sort),
# so snippets can rely on XDG, PATH, MANPATH and homebrew being ready.
# `finit <name>` runs functions/init/_finit_<name>.

# Autoload from functions/ subdirs first, so finit and the _finit_* steps
# (in functions/init/) and everything else resolve.
set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path

finit xdg
finit manpath
finit path
finit prerun_events
finit homebrew

set -g OSTYPE (uname -s | string lower)
set -gx DOTFILES $HOME/.dotfiles
set -gx MY_PROJECTS $HOME/Projects
