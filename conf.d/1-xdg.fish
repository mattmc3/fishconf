# https://wiki.archlinux.org/index.php/XDG_Base_Directory
# re-home app configs
set -q ATOM_HOME             ;or set -gx ATOM_HOME "$XDG_CONFIG_HOME"/atom
set -q DOCKER_CONFIG         ;or set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME"/docker
set -q GNUPGHOME             ;or set -gx GNUPGHOME "$XDG_CONFIG_HOME"/gnupg
set -q IPYTHONDIR            ;or set -gx IPYTHONDIR "$XDG_CONFIG_HOME"/jupyter
set -q JUPYTER_CONFIG_DIR    ;or set -gx JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME"/jupyter
set -q LPASS_HOME            ;or set -gx LPASS_HOME "$XDG_CONFIG_HOME"/lpass
set -q NPM_CONFIG_USERCONFIG ;or set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME"/npm/npmrc
set -q RANDFILE              ;or set -gx RANDFILE "$XDG_CONFIG_HOME"/openssl/rnd
set -q SCREENRC              ;or set -gx SCREENRC "$XDG_CONFIG_HOME"/screen/screenrc
set -q TODOTXT_CFG_FILE      ;or set -gx TODOTXT_CFG_FILE "$XDG_CONFIG_HOME"/todotxt/config
set -q WGETRC                ;or set -gx WGETRC "$XDG_CONFIG_HOME"/wgetrc

# re-home app data
set -q LESSHISTFILE          ;or set -gx LESSHISTFILE "$XDG_DATA_HOME"/shell/lesshst
set -q SQLITE_HISTORY        ;or set -gx SQLITE_HISTORY "$XDG_DATA_HOME"/sqlite_history
set -q _Z_DATA               ;or set -gx _Z_DATA "$XDG_DATA_HOME"/z/z.txt

# re-home app cache
set -q NPM_CONFIG_CACHE      ;or set -gx NPM_CONFIG_CACHE "$XDG_CACHE_HOME"/npm

# xdg_runtime_dir
set -q XAUTHORITY            ;or set -gx XAUTHORITY "$XDG_RUNTIME_DIR"/Xauthority

# aliases for apps that suck at modern
alias tmux='tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
