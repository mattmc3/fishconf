function source_cache \
    --description "Source a cached version of a command's output"
    # Usage: source_cache CACHEFILE COMMAND [ARGS...]
    # Example: source_cache fzf_init.fish fzf --fish
    if test (count $argv) -lt 2
        echo >&2 "source_cache: Usage: source_cache CACHEFILE COMMAND [ARGS...]"
        return 1
    end
    set -l cachefile $__fish_cache_dir/$argv[1]
    if not test -r $cachefile
        $argv[2..] >$cachefile 2>/dev/null || begin
            rm -f $cachefile
            return 1
        end
    end
    source $cachefile
end
