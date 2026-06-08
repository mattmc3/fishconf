# init: runs before every other conf.d file (the 00- prefix wins the sort),
# so snippets can rely on XDG, PATH, MANPATH and homebrew being ready.
# Each init_* is a plain function in functions/.

init_xdg
init_manpath
init_function_subdirs
init_path
init_prerun_events
init_homebrew

set -g OSTYPE (uname -s | string lower)
set -gx DOTFILES $HOME/.dotfiles
set -gx MY_PROJECTS $HOME/Projects
