# XDG
# See https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html

# Make sure XDG dirs are set
# System level dirs
# set -q XDG_DATA_DIRS   ;or set -gx XDG_DATA_DIRS /usr/share /usr/local/share
# set -q XDG_CONFIG_DIRS ;or set -gx XDG_CONFIG_DIRS /etc/xdg

# User level dirs
set -q XDG_CACHE_HOME    ;or set -gx XDG_CACHE_HOME $HOME/.cache
set -q XDG_CONFIG_HOME   ;or set -gx XDG_CONFIG_HOME $HOME/.config
set -q XDG_DATA_HOME     ;or set -gx XDG_DATA_HOME $HOME/.local/share
set -q XDG_RUNTIME_DIR   ;or set -gx XDG_RUNTIME_DIR $HOME/.xdg
set -q XDG_DESKTOP_DIR   ;or set -gx XDG_DESKTOP_DIR $HOME/Desktop
set -q XDG_DOWNLOAD_DIR  ;or set -gx XDG_DOWNLOAD_DIR $HOME/Downloads
set -q XDG_DOCUMENTS_DIR ;or set -gx XDG_DOCUMENTS_DIR $HOME/Documents
set -q XDG_MUSIC_DIR     ;or set -gx XDG_MUSIC_DIR $HOME/Music
set -q XDG_PICTURES_DIR  ;or set -gx XDG_PICTURES_DIR $HOME/Pictures
set -q XDG_VIDEOS_DIR    ;or set -gx XDG_VIDEOS_DIR $HOME/Videos

# https://wiki.archlinux.org/index.php/XDG_Base_Directory
#
# re-home app configs (XDG_CONFIG_HOME)
#

# atom
if not set -q ATOM_HOME; and test -e "$XDG_CONFIG_HOME"/atom
    set -gx ATOM_HOME "$XDG_CONFIG_HOME"/atom
end

# docker
if not set -q DOCKER_CONFIG; and test -e "$XDG_CONFIG_HOME"/docker
    set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME"/docker
end

# gnupg
if not set -q GNUPGHOME; and test -e "$XDG_CONFIG_HOME"/gnupg
    set -gx GNUPGHOME "$XDG_CONFIG_HOME"/gnupg
end

# ipython (old name for jupyter)
if not set -q IPYTHONDIR; and test -e "$XDG_CONFIG_HOME"/jupyter
    set -gx IPYTHONDIR "$XDG_CONFIG_HOME"/jupyter
end

# jupyter
if not set -q JUPYTER_CONFIG_DIR; and test -e "$XDG_CONFIG_HOME"/jupyter
    set -gx JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME"/jupyter
end

# lpass
if not set -q LPASS_HOME; and test -e "$XDG_CONFIG_HOME"/lpass
    set -gx LPASS_HOME "$XDG_CONFIG_HOME"/lpass
end

# npm
if not set -q NPM_CONFIG_USERCONFIG; and test -e "$XDG_CONFIG_HOME"/npm/npmrc
    set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME"/npm/npmrc
end

# openssl
if not set -q RANDFILE; and test -e "$XDG_CONFIG_HOME"/openssl/rnd
    set -gx RANDFILE "$XDG_CONFIG_HOME"/openssl/rnd
end

# screenrc
if not set -q SCREENRC; and test -e "$XDG_CONFIG_HOME"/screen/screenrc
    set -gx SCREENRC "$XDG_CONFIG_HOME"/screen/screenrc
end

# todo-txt
if not set -q TODOTXT_CFG_FILE; and test -e "$XDG_CONFIG_HOME"/todo-txt/config
    set -gx TODOTXT_CFG_FILE "$XDG_CONFIG_HOME"/todo-txt/config
end

# wget
if not set -q WGETRC; and test -e "$XDG_CONFIG_HOME"/wget/wgetrc
    set -gx WGETRC "$XDG_CONFIG_HOME"/wget/wgetrc
end

#
# re-home app data (XDG_DATA_HOME)
#

set -q LESSHISTFILE          ;or set -gx LESSHISTFILE "$XDG_DATA_HOME"/shell/lesshst
set -q SQLITE_HISTORY        ;or set -gx SQLITE_HISTORY "$XDG_DATA_HOME"/sqlite_history
set -q _Z_DATA               ;or set -gx _Z_DATA "$XDG_DATA_HOME"/z/data

# re-home app cache
set -q NPM_CONFIG_CACHE      ;or set -gx NPM_CONFIG_CACHE "$XDG_CACHE_HOME"/npm

# xdg_runtime_dir
set -q XAUTHORITY            ;or set -gx XAUTHORITY "$XDG_RUNTIME_DIR"/Xauthority

# aliases for apps that suck at modern
alias tmux='tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
