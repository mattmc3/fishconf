function set_xdg_basedirs --description 'Set XDG basedirs'
    # Set XDG basedirs.
    # https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
    set -q XDG_CONFIG_HOME; or set -Ux XDG_CONFIG_HOME $HOME/.config
    set -q XDG_DATA_HOME; or set -Ux XDG_DATA_HOME $HOME/.local/share
    set -q XDG_STATE_HOME; or set -Ux XDG_STATE_HOME $HOME/.local/state
    set -q XDG_CACHE_HOME; or set -Ux XDG_CACHE_HOME $HOME/.cache
    set -q __fish_cache_dir; or set -Ux __fish_cache_dir $XDG_CACHE_HOME/fish

    for xdgdir in \
        $XDG_CONFIG_HOME \
        $XDG_DATA_HOME \
        $XDG_STATE_HOME \
        $XDG_CACHE_HOME \
        $__fish_cache_dir

        test -d $xdgdir; or mkdir -p $xdgdir
    end
end
