# dotfiles
set -q DOTFILES; or set -gx DOTFILES ~/.config/dotfiles

# path (app specific paths in the apps.fish file)
set -gx PATH \
    "$HOME/bin" \
    "/opt/homebrew/bin" \
    "/opt/homebrew/sbin" \
    "/usr/local/sbin" \
    "/usr/local/bin" \
    "/usr/sbin" \
    "/usr/bin" \
    "/bin"

# no greeting
set fish_greeting

# apps
set -q PAGER; or set -gx PAGER less
set -q VISUAL; or set -gx VISUAL code
set -q EDITOR; or set -gx EDITOR vim

# where I store my projects
set -q PROJECTS; or set -x PROJECTS ~/Projects

# add aliases to fish_function_path
set fish_function_path $fish_function_path $XDG_CONFIG_HOME/fish/aliases

# add function subdirs to fish_function_path
for d in $__fish_config_dir/functions/*/
    set fish_function_path $d $fish_function_path
end

# add completion subdirs to fish_function_path
for d in $__fish_config_dir/completions/*/
    set fish_complete_path $d $fish_complete_path
end
