# https://wiki.archlinux.org/index.php/XDG_Base_Directory

# emacs
if test -e $HOME/.config/emacs/bin
    set -gx PATH $PATH $HOME/.config/emacs/bin
end
if test -e $HOME/.emacs.d/bin
    set -gx PATH $PATH $HOME/.emacs.d/bin
end

# golang
set -gx GLOBALGOPATH "$HOME/Projects/golang"
set -gx GOPATH "$GLOBALGOPATH"
test -e /usr/local/opt/go/libexec/bin && set -gx PATH $PATH /usr/local/opt/go/libexec/bin
test -e "$GLOBALGOPATH/bin" && set -gx PATH $PATH "$GLOBALGOPATH/bin"

# groovy
# set -q GROOVY_HOME; or set -gx GROOVY_HOME /usr/local/opt/groovy/libexec
# set -q GROOVY_TURN_OFF_JAVA_WARNINGS; or set -gx GROOVY_TURN_OFF_JAVA_WARNINGS true

# homebrew
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications"

# java
# set -q JAVA_HOME; or set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"
