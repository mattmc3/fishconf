# Developer language tooling: PATH + env for go, dotnet, node, java, nim, emacs.

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
set_java_home

# nim
test -d $HOME/.nimble/bin; and fish_add_path $HOME/.nimble/bin

# emacs
fish_add_path (path filter $HOME/.emacs.d/bin $XDG_CONFIG_HOME/emacs/bin)
