function cachecmd --description "Cache a command"
    set_xdg_basedirs
    set --local cmdname (
        string join '-' $argv |
        string replace -a '/' '_' |
        string replace -r '^_' ''
    )
    set --local cachefile $__fish_cache_dir/$cmdname.fish
    if not test -f $cachefile
        $argv >$cachefile
    end
    cat $cachefile
end
