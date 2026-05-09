function source_cache --description 'Cache output of a command and source it'
    set -l cachefile $__fish_cache_dir/$argv[1]
    set -e argv[1]
    if not test -f $cachefile
        if not $argv >$cachefile
            rm -f $cachefile
            return 1
        end
    end
    builtin source $cachefile
end
