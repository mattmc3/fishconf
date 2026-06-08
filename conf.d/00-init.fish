# init: runs before every other conf.d file (the 00- prefix wins the sort),
# so snippets can rely on XDG, PATH, MANPATH and homebrew being ready.
# `finit <name>` runs functions/init/_finit_<name>.

# Autoload from functions/ subdirs first, so finit and the _finit_* steps
# (in functions/init/) and everything else resolve.
set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path

# Homebrew, etc. push their own paths; re-apply prepend to prepath afterwards.
set -g prepath (path filter $HOME/bin $HOME/.local/bin)
function prepend_prepath --on-event fish_postinit
    fish_add_path --prepend --move $prepath
end
prepend_prepath

# Initialize manpath
set -q MANPATH; or set -gx MANPATH ''
for mp in (path filter $__fish_data_dir/man /usr/local/share/man /usr/share/man)
    set -ax MANPATH $mp
end

init_xdg
init_homebrew
init_env

set -gx DOTFILES $HOME/.dotfiles
set -gx MY_PROJECTS $HOME/Projects
