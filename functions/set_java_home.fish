function set_java_home --description 'Set JAVA_HOME, with caching'
    if not test -x /usr/libexec/java_home
        return 1
    end

    function __java_home_cmd
        set -l home (/usr/libexec/java_home 2>/dev/null)
        or return 1
        echo "set -gx JAVA_HOME $home"
    end

    cachecmd --source __java_home_cmd
end
