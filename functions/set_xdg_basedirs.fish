function set_xdg_basedirs -d 'Set XDG base dirs'
    # XDG base dirs
    # https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
    set -Ux XDG_CACHE_HOME $HOME/.cache
    set -Ux XDG_CONFIG_HOME $HOME/.config
    set -Ux XDG_DATA_HOME $HOME/.local/share
    set -Ux XDG_STATE_HOME $HOME/.local/state
    set -Ux XDG_RUNTIME_DIR $HOME/.xdg

    set -Ux XDG_DESKTOP_DIR $HOME/Desktop
    set -Ux XDG_DOCUMENTS_DIR $HOME/Documents
    set -Ux XDG_DOWNLOAD_DIR $HOME/Downloads
    set -Ux XDG_PROJECTS_DIR $HOME/Projects

    for xdg_dir in \
        $XDG_CACHE_HOME \
        $XDG_CONFIG_HOME \
        $XDG_DATA_HOME \
        $XDG_STATE_HOME \
        $XDG_RUNTIME_DIR

        [ -d $xdg_dir ]; or mkdir -p $xdg_dir
    end
end
