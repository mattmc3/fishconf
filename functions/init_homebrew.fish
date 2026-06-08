function init_homebrew --description 'Load homebrew shellenv plus keg-only and gem bin dirs'
    set --local brewcmd (path filter /opt/homebrew/bin/brew /usr/local/bin/brew)
    test -n "$brewcmd[1]"; or return 1

    # Cache brew shellenv
    set --local brew_shellenv $__fish_config_dir/.cache/brew_shellenv.fish
    if not test -f $brew_shellenv
        mkdir -p $__fish_config_dir/.cache
        $brewcmd[1] shellenv fish > $brew_shellenv
    end
    source $brew_shellenv

    # Alias brew if there's a different owner
    set -gx HOMEBREW_OWNER (stat -f "%Su" $HOMEBREW_PREFIX 2>/dev/null)
    if test -n "$HOMEBREW_OWNER"; and test (whoami) != "$HOMEBREW_OWNER"
        function brew
            command sudo -Hu $HOMEBREW_OWNER brew $argv
        end
    end

    # keg-only apps: add their bin + man dirs.
    set -q HOMEBREW_KEG_ONLY_APPS; or set -g HOMEBREW_KEG_ONLY_APPS curl ruby sqlite postgresql@18
    for app in $HOMEBREW_KEG_ONLY_APPS
        set -l app_prefix $HOMEBREW_PREFIX/opt/$app
        test -d $app_prefix/bin; and fish_add_path $app_prefix/bin
        test -d $app_prefix/share/man; and set -ax MANPATH $app_prefix/share/man
    end

    # ruby gems bin dirs.
    for gems_bin in $HOMEBREW_PREFIX/lib/ruby/gems/*/bin $HOME/.gem/ruby/*/bin
        test -d $gems_bin; and fish_add_path $gems_bin
    end

    # homebrew fish completions.
    set -l brew_completions $HOMEBREW_PREFIX/share/fish/completions
    if test -d $brew_completions; and not contains -- $brew_completions $fish_complete_path
        set -a fish_complete_path $brew_completions
    end

    set -q HOMEBREW_NO_ANALYTICS; or set -Ux HOMEBREW_NO_ANALYTICS 1
end
