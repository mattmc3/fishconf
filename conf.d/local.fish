set -q fish_config_local; or set -gx fish_config_local $HOME/.config/fish/local

set fish_function_path $fish_function_path[1..2] $fish_config_local/functions $fish_function_path[3..-1]
set fish_complete_path $fish_complete_path[1..2] $fish_config_local/completions $fish_complete_path[3..-1]

for file in $fish_config_local/conf.d/*.fish
    builtin source $file 2>/dev/null
end
