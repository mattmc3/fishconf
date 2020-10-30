function v --description 'Open the $VISUAL editor here'
    set -q VISUAL; or set VISUAL vim
    if [ (count $argv) -eq 0 ]
        set argv '.'
    end
    eval $VISUAL $argv
end
