function ide --description 'Use $VISUAL to open a project directory'
    set --local dir (string match -r '.' $argv '.')[1]
    set -q VISUAL; or set -gx VISUAL vim
    $VISUAL $dir
end
