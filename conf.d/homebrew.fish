type -q brew || return 1

if test (type -p brew) = /opt/homebrew/bin/brew
    #eval (brew shellenv)
    set -gx HOMEBREW_PREFIX /opt/homebrew
    set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
    set -gx HOMEBREW_REPOSITORY /opt/homebrew
    set -q PATH; or set PATH ''
    set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
    set -q MANPATH; or set MANPATH ''
    set -gx MANPATH /opt/homebrew/share/man $MANPATH
    set -q INFOPATH; or set INFOPATH ''
    set -gx INFOPATH /opt/homebrew/share/info $INFOPATH
end

set -q MANPATH || set -gx MANPATH ''

# Add keg-only apps
for app in ruby curl
    if test -d $HOMEBREW_PREFIX/opt/$app/bin
        fish_add_path $HOMEBREW_PREFIX/opt/$app/bin
        set MANPATH $HOMEBREW_PREFIX/opt/$app/share/man $MANPATH
    end
end

# Add homebrew completions
if [ -e $HOMEBREW_PREFIX/share/fish/completions ]
    set -a fish_complete_path $HOMEBREW_PREFIX/share/fish/completions
end

# Other homebrew vars
set -gx HOMEBREW_NO_ANALYTICS 1
