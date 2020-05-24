# https://wiki.archlinux.org/index.php/XDG_Base_Directory
# re-home app configs (XDG_CONFIG_HOME)

# atom
set -q ATOM_HOME; or set -gx ATOM_HOME "$XDG_CONFIG_HOME/atom"

# docker
set -q DOCKER_CONFIG; or set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"
set -q MACHINE_STORAGE_PATH; or set -gx MACHINE_STORAGE_PATH "$XDG_DATA_HOME/docker-machine"

# emacs
set -gx PATH $PATH ~/.emacs.d/bin

# gnupg
set -q GNUPGHOME; or set -gx GNUPGHOME "$XDG_CONFIG_HOME/gnupg"

# golang
set -gx GLOBALGOPATH "$HOME/Projects/golang"
set -gx GOPATH "$GLOBALGOPATH"
set -gx PATH $PATH "$GLOBALGOPATH/bin"

# groovy
set -q GROOVY_HOME; or set -gx GROOVY_HOME "/usr/local/opt/groovy/libexec"
set -q GROOVY_TURN_OFF_JAVA_WARNINGS; or set -gx GROOVY_TURN_OFF_JAVA_WARNINGS "true"

# homebrew
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications"

# ipython (old name for jupyter)
set -q IPYTHONDIR; or set -gx IPYTHONDIR "$XDG_CONFIG_HOME/jupyter"

# java
set -q JAVA_HOME; or set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/openjdk-13.jdk/Contents/Home"

# jupyter
set -q JUPYTER_CONFIG_DIR; or set -gx JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME/jupyter"

# less
set -q LESSKEY; or set -gx LESSKEY "$XDG_CONFIG_HOME/less/lesskey"
set -q LESSHISTFILE; or set -gx LESSHISTFILE "$XDG_DATA_HOME/shell/lesshst"

# lpass
set -q LPASS_HOME; or set -gx LPASS_HOME "$XDG_CONFIG_HOME/lpass"
set -q LPASS_AGENT_TIMEOUT; or set -gx LPASS_AGENT_TIMEOUT 0

# npm
set -gx PATH $PATH $XDG_DATA_HOME/npm/bin
set -q NPM_CONFIG_USERCONFIG; or set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
set -q NPM_CONFIG_CACHE; or set -gx NPM_CONFIG_CACHE "$XDG_CACHE_HOME/npm"

# node.js
set -q NVM_DIR; or set -gx NVM_DIR "$XDG_DATA_HOME/nvm"
set -q NODE_REPL_HISTORY; or set -gx NODE_REPL_HISTORY "$XDG_DATA_HOME/node/node_repl_history"

# openssl
set -q RANDFILE; or set -gx RANDFILE "$XDG_CONFIG_HOME/openssl/rnd"

# python
set -q PYLINTHOME; or set -gx PYLINTHOME "$XDG_CACHE_HOME/pylint"
set -q WORKON_HOME; or set -gx WORKON_HOME "$XDG_DATA_HOME/venvs"

# postgres
set -q PSQLRC; or set -gx PSQLRC "$XDG_CONFIG_HOME/pg/psqlrc"
set -q PSQL_HISTORY; or set -gx PSQL_HISTORY "$XDG_CACHE_HOME/pg/psql_history"
set -q PGPASSFILE; or set -gx PGPASSFILE "$XDG_CONFIG_HOME/pg/pgpass"
set -q PGSERVICEFILE; or set -gx PGSERVICEFILE "$XDG_CONFIG_HOME/pg/pg_service.conf"

# ruby
set -gx PATH $PATH "/usr/local/opt/ruby/bin"
set -q GEM_HOME; or set -gx GEM_HOME "$XDG_DATA_HOME/gem"
set -q GEM_SPEC_CACHE; or set -gx GEM_SPEC_CACHE "$XDG_DATA_HOME/gem"
set -q BUNDLE_USER_CONFIG; or set -gx BUNDLE_USER_CONFIG "$XDG_CONFIG_HOME/bundle"
set -q BUNDLE_USER_CACHE; or set -gx BUNDLE_USER_CACHE "$XDG_CACHE_HOME/bundle"
set -q BUNDLE_USER_PLUGIN; or set -gx BUNDLE_USER_PLUGIN "$XDG_DATA_HOME/bundle"

# screenrc
set -q SCREENRC; or set -gx SCREENRC "$XDG_CONFIG_HOME/screen/screenrc"

# sqlite
set -q SQLITE_HISTORY; or set -gx SQLITE_HISTORY "$XDG_DATA_HOME/sqlite_history"

# todo-txt
set -q TODOTXT_CFG_FILE; or set -gx TODOTXT_CFG_FILE "$XDG_CONFIG_HOME/todo-txt/config"

# vagrant
set -q VAGRANT_HOME; or set -gx VAGRANT_HOME "$XDG_DATA_HOME/vagrant"
set -q VAGRANT_ALIAS_FILE; or set -gx VAGRANT_ALIAS_FILE "$XDG_DATA_HOME/vagrant/aliases"

# wget
set -q WGETRC; or set -gx WGETRC "$XDG_CONFIG_HOME/wget/wgetrc"

# z
set -q _Z_DATA; or set -gx _Z_DATA "$XDG_DATA_HOME/z/data"

# set -g fish_user_paths $fish_user_paths "/usr/local/opt/sqlite/bin"
# set -g fish_user_paths $fish_user_paths "/usr/local/opt/bison/bin"
