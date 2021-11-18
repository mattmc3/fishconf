# App settings
# https://wiki.archlinux.org/index.php/XDG_Base_Directory
# re-home app configs (XDG_CONFIG_HOME)

# atom
set -gx ATOM_HOME $XDG_CONFIG_HOME/atom

# docker
set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -gx MACHINE_STORAGE_PATH $XDG_DATA_HOME/docker-machine

# gnupg
set -gx GNUPGHOME $XDG_CONFIG_HOME/gnupg
alias gpg='command gpg --homedir "$GNUPGHOME"'

# jupyter
set -gx JUPYTER_CONFIG_DIR $XDG_CONFIG_HOME/jupyter
set -gx IPYTHONDIR $XDG_CONFIG_HOME/jupyter

# less
set -gx LESSKEY $XDG_CONFIG_HOME/less/lesskey
set -gx LESSHISTFILE $XDG_DATA_HOME/shell/lesshst

# lpass
set -gx LPASS_HOME $XDG_CONFIG_HOME/lpass

# npm
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx NPM_CONFIG_CACHE $XDG_CACHE_HOME/npm

# node.js
set -gx NVM_DIR $XDG_DATA_HOME/nvm
set -gx NODE_REPL_HISTORY $XDG_DATA_HOME/node/node_repl_history

# openssl
set -gx RANDFILE $XDG_CONFIG_HOME/openssl/rnd

# python
set -gx PYLINTHOME $XDG_CACHE_HOME/pylint
set -gx WORKON_HOME $XDG_DATA_HOME/venvs

# postgres
set -gx PSQLRC $XDG_CONFIG_HOME/pg/psqlrc
set -gx PSQL_HISTORY $XDG_CACHE_HOME/pg/psql_history
set -gx PGPASSFILE $XDG_CONFIG_HOME/pg/pgpass
set -gx PGSERVICEFILE $XDG_CONFIG_HOME/pg/pg_service.conf

# ruby
set -gx GEM_HOME $XDG_DATA_HOME/gem
set -gx GEM_SPEC_CACHE $XDG_DATA_HOME/gem
set -gx BUNDLE_USER_CONFIG $XDG_CONFIG_HOME/bundle
set -gx BUNDLE_USER_CACHE $XDG_CACHE_HOME/bundle
set -gx BUNDLE_USER_PLUGIN $XDG_DATA_HOME/bundle

# screenrc
set -gx SCREENRC $XDG_CONFIG_HOME/screen/screenrc

# sqlite
set -gx SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history

# tmux
alias tmux 'command tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'

# todo-txt
set -gx TODOTXT_CFG_FILE $XDG_CONFIG_HOME/todo-txt/config

# vagrant
set -gx VAGRANT_HOME $XDG_DATA_HOME/vagrant
set -gx VAGRANT_ALIAS_FILE $XDG_DATA_HOME/vagrant/aliases

# wget
set -gx WGETRC $XDG_CONFIG_HOME/wget/wgetrc
alias wget 'command wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# z
set -gx _Z_DATA $XDG_DATA_HOME/z/data
