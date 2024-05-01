# Ensure homebrew exists
set brewcmds (
    path filter \
        $HOME/.homebrew/bin/brew \
        $HOME/.linuxbrew/bin/brew \
        /opt/homebrew/bin/brew \
        /usr/local/bin/brew
    )
test (count $brewcmds) -gt 0 || return 1

# Ensure a place to store cache exists
set -q __fish_cache_dir || set -gx __fish_cache_dir $HOME/.cache/fish
set brew_init $__fish_cache_dir/brew_init.fish

# Remove cached files older than one day.
find $__fish_cache_dir -depth 1 -type f -mtime +1 -delete &>/dev/null

# Cache brew init fish command
if not test -r $brew_init
    mkdir -p (path dirname $brew_init)
    $brewcmds[1] shellenv > $brew_init
end

# Init brew
source $brew_init
