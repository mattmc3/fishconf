# local settings
set -e fish_config_local
if test -d $HOME/.config/fish/local
    plugin-load $HOME/.config/fish/local
end
if test -d $DOTFILES.local/fish
    plugin-load $DOTFILES.local/fish
end
