# local settings
set -e fish_config_local
if test -d $HOME/.config/fish/local
    load_plugin $HOME/.config/fish/local
end
if test -d $DOTFILES.local/fish
    load_plugin $DOTFILES.local/fish
end
