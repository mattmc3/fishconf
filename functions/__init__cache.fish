function __init__cache --description 'Setup fish cache dir + sweep stale entries'
    set -q __fish_cache_dir; or set -gx __fish_cache_dir $XDG_CACHE_HOME/fish
    test -d $__fish_cache_dir; or mkdir -p $__fish_cache_dir
    find $__fish_cache_dir -name '*.fish' -type f -mmin +1200 -delete &
    disown
end
