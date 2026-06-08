function _finit_homebrew --description 'Load homebrew shellenv plus keg-only and gem bin dirs'
    if test -e /opt/homebrew/bin/brew
        /opt/homebrew/bin/brew shellenv fish | source
    else if test -e /usr/local/bin/brew
        /usr/local/bin/brew shellenv fish | source
    else
        return
    end

    set -gx HOMEBREW_OWNER (stat -f "%Su" $HOMEBREW_PREFIX 2>/dev/null)

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

    set -q HOMEBREW_NO_ANALYTICS; or set -gx HOMEBREW_NO_ANALYTICS 1
end
