function fished
    cd ~/.config/fish
    if set -q VISUAL
        $VISUAL .
    else if set -q EDITOR
        $EDITOR .
    else
        vim .
    end
end
