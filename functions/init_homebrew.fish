function init_homebrew
    # Bootstrap homebrew shellenv (cached).
    if not test -s $__fish_cache_dir/brew_init.fish
        if test -e /opt/homebrew/bin/brew
            /opt/homebrew/bin/brew shellenv >$__fish_cache_dir/brew_init.fish
        else if test -e /usr/local/bin/brew
            /usr/local/bin/brew shellenv >$__fish_cache_dir/brew_init.fish
        else
            return 1
        end
    end
    source $__fish_cache_dir/brew_init.fish

    # Add keg-only app bin and man dirs to PATH/MANPATH.
    set -q HOMEBREW_KEG_ONLY_APPS; or set -g HOMEBREW_KEG_ONLY_APPS \
        curl ruby sqlite postgresql@18
    for app in $HOMEBREW_KEG_ONLY_APPS
        set -l app_prefix $HOMEBREW_PREFIX/opt/$app
        test -d $app_prefix/bin; and fish_add_path $app_prefix/bin
        test -d $app_prefix/share/man; and set -a MANPATH $app_prefix/share/man
    end

    # Add ruby gems bin dirs.
    for gems_bin in $HOMEBREW_PREFIX/lib/ruby/gems/*/bin $HOME/.gem/ruby/*/bin
        test -d $gems_bin; and fish_add_path $gems_bin
    end

    # Add homebrew fish completions.
    set -l brew_completions $HOMEBREW_PREFIX/share/fish/completions
    if test -d $brew_completions
        contains -- $brew_completions $fish_complete_path
        or set -a fish_complete_path $brew_completions
    end

    # Homebrew settings.
    set -q HOMEBREW_NO_ANALYTICS; or set -gx HOMEBREW_NO_ANALYTICS 1
end
