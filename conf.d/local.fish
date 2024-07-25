if test -r $__fish_config_dir/config.local.fish
    source $__fish_config_dir/config.local.fish
else
    set -q DOTFILES
    or set -Ux DOTFILES $HOME/.dotfiles
    set --local fishconfloc
    for fishconfloc in \
        "$DOTFILES.local/fish/conf.d/local.fish" \
        "$DOTFILES.local/.config/fish/conf.d/local.fish"

        test -e $fishconfloc && ln -sf $fishconfloc $__fish_config_dir/config.local.fish
    end
end
