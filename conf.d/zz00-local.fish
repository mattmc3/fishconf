# local settings
if ! test -d $__fish_config_dir/local && test -d $DOTFILES.local/fish
    ln -s $DOTFILES.local/fish $__fish_config_dir/local
end
if test -d $__fish_config_dir/local
    plugin-load $__fish_config_dir/local
end
