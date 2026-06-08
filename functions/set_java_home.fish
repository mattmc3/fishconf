function set_java_home --description 'Set JAVA_HOME, with caching'
    if not test -x /usr/libexec/java_home
        return 1
    end

    set -l java_cache "$__fish_config_dir/.cache/java_home.fish"
    mkdir -p (dirname $java_cache)

    if not test -f $java_cache
        /usr/libexec/java_home 2>/dev/null | read java_home
        or return 1
        echo "set -gx JAVA_HOME $java_home" > $java_cache
    end

    source $java_cache
end
