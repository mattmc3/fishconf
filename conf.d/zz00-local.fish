# local settings
set -e fish_config_local
if test -d $HOME/.config/fish/local
    set -a fish_config_local "$HOME/.config/fish/local"
end
if test -d $DOTFILES/local/fish
    set -a fish_config_local "$DOTFILES/local/fish"
end

for d in $fish_config_local
    if test -d $d/functions
        set fish_function_path $d/functions $fish_function_path
    end
    if test -d $d/completions
        set fish_complete_path $d/completions $fish_complete_path
    end
    if test -f $fish_config_local/config.fish
        source $fish_config_local/config.fish
    end
    for file in $fish_config_local/conf.d/*.fish
        builtin source $file 2>/dev/null
    end
end
