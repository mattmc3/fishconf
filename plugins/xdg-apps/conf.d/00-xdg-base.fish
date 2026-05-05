# Set XDG basedirs.
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# https://wiki.archlinux.org/title/XDG_Base_Directory
set -q XDG_CONFIG_HOME || set -Ux XDG_CONFIG_HOME $HOME/.config
set -q XDG_DATA_HOME || set -Ux XDG_DATA_HOME $HOME/.local/share
set -q XDG_STATE_HOME || set -Ux XDG_STATE_HOME $HOME/.local/state
set -q XDG_CACHE_HOME || set -Ux XDG_CACHE_HOME $HOME/.cache
set -q XDG_RUNTIME_DIR || set -Ux XDG_RUNTIME_DIR $HOME/.xdg
for xdgdir in (path filter -vd $XDG_CONFIG_HOME $XDG_DATA_HOME $XDG_STATE_HOME $XDG_CACHE_HOME $XDG_RUNTIME_DIR)
    mkdir -p $xdgdir
end
