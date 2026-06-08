# Developer language tooling: PATH + env for go, dotnet, node, java.

# go
fish_add_path (path filter $HOME/go/bin)

# dotnet (+ Rider)
set -g pre_path $pre_path (path filter $DOTNET_CLI_HOME/tools /Applications/Rider.app/Contents/MacOS)
fish_add_path --prepend --move $pre_path

# node
if type -q node
    fish_add_path (path filter $HOMEBREW_PREFIX/share/npm/bin)
end

# java
if test -x /usr/libexec/java_home
    fish --no-config -c 'printf "set -gx JAVA_HOME %s\n" (/usr/libexec/java_home 2>/dev/null)' | source
end
