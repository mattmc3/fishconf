function fished -d "Switch to the fish configuration directory and open an editor"
    cd $__fish_config_dir
    if set -q VISUAL
        $VISUAL .
    else if set -q EDITOR
        $EDITOR .
    else
        vim .
    end
end
