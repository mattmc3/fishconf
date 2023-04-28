function ide --description 'Use $VISUAL to open a project directory'
    set -l dir (string match -r '.' $argv '.')[1]
    set -q VISUAL || set -Ux VISUAL vim
    $VISUAL $dir
end
