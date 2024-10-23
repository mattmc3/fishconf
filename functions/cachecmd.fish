function cachecmd --description "Cache a command"
    set --local cmdfile (
        string join '-' $argv |
        string replace -a '/' '_' |
        string replace -r '^_' ''
    ).fish
    set --local cachedir $XDG_CACHE_HOME/fish
    if not set -q XDG_CACHE_HOME
        set cachedir $HOME/.cache/fish
    end
    test -d $cachedir || mkdir -p $cachedir

    # Remove expired cache files.
    find $cachedir -name $cmdfile -type f -mmin +1200 -delete

    if not test -f $cachedir/$cmdfile
        $argv >$cachedir/$cmdfile
    end
    cat $cachedir/$cmdfile
end
