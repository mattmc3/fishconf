#
# pre - First things first.
#

# Run 'brew shellenv | source' in order of preference.
for brew_prefix in \
    $HOME/.homebrew \
    /opt/homebrew \
    /usr/local

    if test -e "$brew_prefix/bin/brew"
        cachecmd "$brew_prefix/bin/brew" shellenv | source
        break
    end
end
set -e brew_prefix

# Add keg-only apps
for app in ruby curl sqlite
    if test -d "$HOMEBREW_PREFIX/opt/$app/bin"
        fish_add_path "$HOMEBREW_PREFIX/opt/$app/bin"
        set MANPATH "$HOMEBREW_PREFIX/opt/$app/share/man" $MANPATH
    end
end

# Add homebrew completions
if test -e "$HOMEBREW_PREFIX/share/fish/completions"
    set -a fish_complete_path "$HOMEBREW_PREFIX/share/fish/completions"
end

# Other homebrew vars.
set -gx HOMEBREW_NO_ANALYTICS 1

# Add more man page paths.
for manpath in (path filter $__fish_data_dir/man /usr/local/share/man /usr/share/man)
    set -a MANPATH $manpath
end

# Allow subdirs for functions and completions.
set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path
set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path

# Add bin directories to path.
fish_add_path --prepend $HOME/.local/bin
fish_add_path --prepend $HOME/bin
