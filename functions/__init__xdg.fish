function __init__xdg --description 'Set XDG basedirs'
    set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME $HOME/.config
    set -q XDG_DATA_HOME; or set -gx XDG_DATA_HOME $HOME/.local/share
    set -q XDG_STATE_HOME; or set -gx XDG_STATE_HOME $HOME/.local/state
    set -q XDG_CACHE_HOME; or set -gx XDG_CACHE_HOME $HOME/.cache
    set -q XDG_RUNTIME_DIR; or set -gx XDG_RUNTIME_DIR $HOME/.xdg
    for xdgdir in (path filter -vd $XDG_CONFIG_HOME $XDG_DATA_HOME $XDG_STATE_HOME $XDG_CACHE_HOME $XDG_RUNTIME_DIR)
        mkdir -p $xdgdir
    end
end
