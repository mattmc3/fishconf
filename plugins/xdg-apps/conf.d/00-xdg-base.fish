# Set XDG basedirs.
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# https://wiki.archlinux.org/title/XDG_Base_Directory
set -q XDG_CONFIG_HOME; or set -Ux XDG_CONFIG_HOME $HOME/.config
set -q XDG_DATA_HOME; or set -Ux XDG_DATA_HOME $HOME/.local/share
set -q XDG_STATE_HOME; or set -Ux XDG_STATE_HOME $HOME/.local/state
set -q XDG_CACHE_HOME; or set -Ux XDG_CACHE_HOME $HOME/.cache
set -eU XDG_RUNTIME_DIR
if not set -q XDG_RUNTIME_DIR
    set -l xdg_runtime_base /tmp
    set -q TMPDIR; and set xdg_runtime_base $TMPDIR
    set -gx XDG_RUNTIME_DIR (string trim -r -c / -- $xdg_runtime_base)/xdg-runtime-(id -u)
end
for xdgdir in (path filter -vd $XDG_CONFIG_HOME $XDG_DATA_HOME $XDG_STATE_HOME $XDG_CACHE_HOME $XDG_RUNTIME_DIR)
    mkdir -p $xdgdir
end
chmod 700 $XDG_RUNTIME_DIR 2>/dev/null
