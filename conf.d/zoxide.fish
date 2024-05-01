# Initialize zoxide for fast jumping with 'z'.
type -q zoxide || return 1

# Ensure a place to store cache exists
set -q __fish_cache_dir || set -gx __fish_cache_dir $HOME/.cache/fish
set zoxide_init $__fish_cache_dir/zoxide_init.fish

# Remove cached files older than one day.
find $__fish_cache_dir -depth 1 -type f -mtime +1 -delete &>/dev/null

# Cache zoxide init fish command
if not test -r $zoxide_init
    mkdir -p (path dirname $zoxide_init)
    zoxide init fish > $zoxide_init
end

# Init zoxide
source $zoxide_init
