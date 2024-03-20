if not test -f $__fish_config_dir/config.local.fish
    set --local fishconfloc
    for fishconfloc in \
        "$DOTFILES.local/fish/conf.d/local.fish" \
        "$DOTFILES.local/.config/fish/conf.d/local.fish"

        test -e $fishconfloc && ln -sf $fishconfloc $__fish_config_dir/config.local.fish
    end
end

test -r $__fish_config_dir/config.local.fish
and source $__fish_config_dir/config.local.fish
or return 1
