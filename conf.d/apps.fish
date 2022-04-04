# https://wiki.archlinux.org/index.php/XDG_Base_Directory

# emacs
if [ -d $HOME/.config/emacs/bin ]
    set -gx PATH $PATH $HOME/.config/emacs/bin
end
if [ -d $HOME/.emacs.d/bin ]
    set -gx PATH $PATH $HOME/.emacs.d/bin
end

# golang
set -gx GLOBALGOPATH "$HOME/Projects/golang"
set -gx GOPATH "$GLOBALGOPATH"
set -gx PATH $PATH /usr/local/opt/go/libexec/bin
set -gx PATH $PATH "$GLOBALGOPATH/bin"

# gnupg
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
# alias gpg 'command gpg --homedir "$GNUPGHOME"'

# groovy
set -q GROOVY_HOME; or set -gx GROOVY_HOME /usr/local/opt/groovy/libexec
set -q GROOVY_TURN_OFF_JAVA_WARNINGS; or set -gx GROOVY_TURN_OFF_JAVA_WARNINGS true

# homebrew
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications"

# java
set -q JAVA_HOME; or set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/adoptopenjdk-15.jdk/Contents/Home"
# alias j15 "set -q JAVA_HOME (/usr/libexec/java_home -v 15); java -version"

# jupyter
set -gx JUPYTER_CONFIG_DIR $XDG_CONFIG_HOME/jupyter
set -gx IPYTHONDIR $XDG_CONFIG_HOME/jupyter

# less
set -gx LESSKEY $XDG_CONFIG_HOME/less/lesskey
set -gx LESSHISTFILE $XDG_DATA_HOME/shell/lesshst

# lpass
set -gx LPASS_HOME $XDG_CONFIG_HOME/lpass
set -q LPASS_AGENT_TIMEOUT; or set -gx LPASS_AGENT_TIMEOUT 0

# node
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx NPM_CONFIG_CACHE $XDG_CACHE_HOME/npm
set -gx PATH $PATH /usr/local/share/npm/bin
set -gx NVM_DIR $XDG_DATA_HOME/nvm
set -gx NODE_REPL_HISTORY $XDG_DATA_HOME/node/node_repl_history

# openssl
set -gx RANDFILE $XDG_CONFIG_HOME/openssl/rnd

# postgres
set -gx PSQLRC $XDG_CONFIG_HOME/pg/psqlrc
set -gx PSQL_HISTORY $XDG_CACHE_HOME/pg/psql_history
set -gx PGPASSFILE $XDG_CONFIG_HOME/pg/pgpass
set -gx PGSERVICEFILE $XDG_CONFIG_HOME/pg/pg_service.conf

# python
set -gx PYLINTHOME $XDG_CACHE_HOME/pylint
set -gx WORKON_HOME $XDG_DATA_HOME/venvs

# ruby
set -gx GEM_HOME $XDG_DATA_HOME/gem
set -gx GEM_SPEC_CACHE $XDG_DATA_HOME/gem
set -gx BUNDLE_USER_CONFIG $XDG_CONFIG_HOME/bundle
set -gx BUNDLE_USER_CACHE $XDG_CACHE_HOME/bundle
set -gx BUNDLE_USER_PLUGIN $XDG_DATA_HOME/bundle
set -gx PATH $PATH /usr/local/opt/ruby/bin

# screenrc
set -gx SCREENRC $XDG_CONFIG_HOME/screen/screenrc

# sqlite
set -gx SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history

# tmux
# alias tmux 'command tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'

# todo-txt
set -gx TODOTXT_CFG_FILE $XDG_CONFIG_HOME/todo-txt/config

# wget
set -gx WGETRC $XDG_CONFIG_HOME/wget/wgetrc
# alias wget 'command wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# z
set -gx _Z_DATA $XDG_DATA_HOME/z/data
