function cachecmd --description "Cache command output, skip running if fresh"
    set -l cachedir $__fish_config_dir/.cache
    set -l cmdfile (string join '_' -- $argv | string replace -ar '[/-]' '_' | string replace -ar '_+' '_' | string replace -r '^_' '').fish
    set -l cachefile $cachedir/$cmdfile

    test -d $cachedir; or mkdir -p $cachedir
    test -f $cachefile; or $argv > $cachefile
    cat $cachefile
end
