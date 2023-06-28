# eval (brew shellenv)

# Man pages paths
if test (count $MANPATH) -eq 0
    set -gx MANPATH /usr/local/share/man
else
    set -gx MANPATH /usr/local/share/man $MANPATH
end

# We always want /usr/local/bin dirs, but on Apple Silicon we also need
# /opt/homebrew/bin dirs
fish_add_path /usr/local/bin /usr/local/sbin
if [ -e /opt/homebrew/bin/brew ]
    set -gx HOMEBREW_PREFIX /opt/homebrew
    fish_add_path $HOMEBREW_PREFIX/bin $HOMEBREW_PREFIX/sbin
    set -gx MANPATH $HOMEBREW_PREFIX/share/man $MANPATH
else if [ -e /usr/local/bin/brew ]
    set -gx HOMEBREW_PREFIX /usr/local
end

# Add homebrew completions
if [ -e $HOMEBREW_PREFIX/share/fish/completions ]
    set -a fish_complete_path $HOMEBREW_PREFIX/share/fish/completions
end

# Other homebrew vars
set -gx HOMEBREW_NO_ANALYTICS 1
