#
# java
#

if test -x /usr/libexec/java_home
    set -l _java_home (/usr/libexec/java_home 2>/dev/null)
    test -n "$_java_home" && set -gx JAVA_HOME $_java_home
end
