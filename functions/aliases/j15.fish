# Defined via `source`
function j15 --wraps='set -q JAVA_HOME (/usr/libexec/java_home -v 15); java -version' --description 'alias j15 set -q JAVA_HOME (/usr/libexec/java_home -v 15); java -version'
    set -q JAVA_HOME (/usr/libexec/java_home -v 15)
    java -version $argv
end
