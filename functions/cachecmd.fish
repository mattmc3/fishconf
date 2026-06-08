function cachecmd --description "Cache command output, skip running if fresh"
    set -l source_it false
    if string match -q -- '--source' $argv[1]
        set source_it true
        set argv $argv[2..]
    end

    set -l cachedir $__fish_config_dir/.cache
    set -l cmdfile (string join '_' -- $argv | string replace -ar '[/-]' '_' | string replace -ar '_+' '_' | string replace -r '^_' '').fish
    set -l cachefile $cachedir/$cmdfile

    mkdir -p $cachedir
    test -f $cachefile; or $argv > $cachefile

    if $source_it
        builtin source $cachefile
    else
        cat $cachefile
    end
end
