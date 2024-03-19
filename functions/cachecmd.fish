function cachecmd --description "Cache a command" --argument-names cmdname
    # Ensure cache dir exists
    set -q XDG_CACHE_HOME; or set -Ux XDG_CACHE_HOME $HOME/.cache
    set -q __fish_cache_dir; or set -Ux __fish_cache_dir $XDG_CACHE_HOME/fish
    test -d $__fish_cache_dir; or mkdir -p $__fish_cache_dir

    set --local cachefile $__fish_cache_dir/$cmdname.fish
    if not test -f $cachefile
        $argv[2..] > $cachefile
    end
    source $cachefile
end
