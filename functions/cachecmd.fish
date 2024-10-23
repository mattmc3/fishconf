function cachecmd --description "Cache a command"
    set --local cmdname (
        string join '-' $argv |
        string replace -a '/' '_' |
        string replace -r '^_' ''
    )
    set --local cachefile $XDG_CACHE_HOME/fish/$cmdname.fish
    if not set -q XDG_CACHE_HOME
        set cachefile $HOME/.cache/fish/$cmdname.fish
    end
    mkdir -p (path dirname $cachefile)

    # Remove expired cache files.
    find (path dirname $cachefile) -name (path basename $cachefile) -type f -mmin +1200 -delete

    if not test -f $cachefile
        $argv >$cachefile
    end
    cat $cachefile
end
