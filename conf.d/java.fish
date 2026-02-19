#
# java
#

if test -x /usr/libexec/java_home
    source_cache java_init.fish fish --no-config -c 'printf "set -gx JAVA_HOME %s\n" (/usr/libexec/java_home 2>/dev/null)'
end
