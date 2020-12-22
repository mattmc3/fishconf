# emacs
set -gx PATH $PATH ~/.emacs.d/bin

# golang
set -gx GLOBALGOPATH "$HOME/Projects/golang"
set -gx GOPATH "$GLOBALGOPATH"
set -gx PATH $PATH "/usr/local/opt/go/libexec/bin"
set -gx PATH $PATH "$GLOBALGOPATH/bin"

# groovy
set -q GROOVY_HOME; or set -gx GROOVY_HOME "/usr/local/opt/groovy/libexec"
set -q GROOVY_TURN_OFF_JAVA_WARNINGS; or set -gx GROOVY_TURN_OFF_JAVA_WARNINGS "true"

# homebrew
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications"

# java
set -q JAVA_HOME; or set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/adoptopenjdk-15.jdk/Contents/Home"
alias j15 "set -q JAVA_HOME (/usr/libexec/java_home -v 15); java -version"

# lpass
set -q LPASS_AGENT_TIMEOUT; or set -gx LPASS_AGENT_TIMEOUT 0

# npm
set -gx PATH $PATH "/usr/local/share/npm/bin"

# ruby
set -gx PATH $PATH "/usr/local/opt/ruby/bin"
