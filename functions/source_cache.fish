function source_cache --description 'Cache output of a command and source it'
    set -l cachefile $__fish_config_dir/.cache/$argv[1]
    set -e argv[1]
    if not test -s $cachefile
        if not $argv >$cachefile
            rm -f $cachefile
            return 1
        end
    end
    builtin source $cachefile
end
