function fished
    cd $__fish_config_dir
    if set -q VISUAL
        $VISUAL .
    else if set -q EDITOR
        $EDITOR .
    else
        vim .
    end
end
