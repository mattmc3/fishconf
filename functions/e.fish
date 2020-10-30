function e --description 'Open the $EDITOR editor here'
    set -q EDITOR; or set EDITOR vim
    if [ (count $argv) -eq 0 ]
        set argv '.'
    end
    eval $EDITOR $argv
end
