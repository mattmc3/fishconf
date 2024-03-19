function cachecmd --description "Cache a command"
    # Ensure cache dir exists
    set -q XDG_CACHE_HOME; or set -Ux XDG_CACHE_HOME $HOME/.cache
    set -q __fish_cache_dir; or set -Ux __fish_cache_dir $XDG_CACHE_HOME/fish
    test -d $__fish_cache_dir; or mkdir -p $__fish_cache_dir

    set --local cmdname (
        string join '-' $argv |
        string replace -a '/' '_' |
        string replace -r '^_' ''
    )
    set --local cachefile $__fish_cache_dir/$cmdname.fish
    if not test -f $cachefile
        $argv > $cachefile
    end
    cat $cachefile
end
