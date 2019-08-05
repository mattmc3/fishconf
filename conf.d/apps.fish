# lpass
set -q LPASS_AGENT_TIMEOUT; or set -gx LPASS_AGENT_TIMEOUT 0

# golang
set -x GLOBALGOPATH $HOME/Projects/golang
set -x GOPATH $GLOBALGOPATH

# Groovy
set -q GROOVY_HOME; or set -gx GROOVY_HOME "/usr/local/opt/groovy/libexec"

# set -g fish_user_paths $fish_user_paths "/usr/local/opt/sqlite/bin"
# set -g fish_user_paths $fish_user_paths "/usr/local/opt/bison/bin"
