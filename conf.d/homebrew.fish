if test -e ~/brew/bin/brew
    set -gx HOMEBREW_PREFIX $HOME/brew
    fish_add_path -p /opt/homebrew/bin
    eval ($HOMEBREW_PREFIX/bin/brew shellenv)
else if test -e /opt/homebrew/bin/brew
    set -gx HOMEBREW_PREFIX /opt/homebrew
    eval ($HOMEBREW_PREFIX/bin/brew shellenv)
else
    return 1
end

# Add keg-only apps
for app in ruby curl
    if test -d $HOMEBREW_PREFIX/opt/$app/bin
        fish_add_path $HOMEBREW_PREFIX/opt/$app/bin
        set MANPATH $HOMEBREW_PREFIX/opt/$app/share/man $MANPATH
    end
end

# Add homebrew completions
if test -e $HOMEBREW_PREFIX/share/fish/completions
    set -a fish_complete_path $HOMEBREW_PREFIX/share/fish/completions
end

# Other homebrew vars
set -gx HOMEBREW_NO_ANALYTICS 1
