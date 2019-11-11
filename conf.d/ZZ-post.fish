# local settings

if test -d $HOME/.config/fish/functions.local
    set fish_function_path $HOME/.config/fish/functions.local $fish_function_path
else if test -d $DOTFILES/local/fish/fish/functions.local
    set fish_function_path $DOTFILES/local/fish/fish/functions.local $fish_function_path
end

if test -f $HOME/.config/fish/config.local.fish
    source $HOME/.config/fish/config.local.fish
else if test -f $DOTFILES/local/fish/fish/config.local.fish
    source $DOTFILES/local/fish/fish/config.local.fish
end
