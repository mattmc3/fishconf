# local settings
set -e fish_config_local
if test -d $HOME/.config/fish/local
    plugin_load $HOME/.config/fish/local
end
if test -d $DOTFILES.local/fish
    plugin_load $DOTFILES.local/fish
end
