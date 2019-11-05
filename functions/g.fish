function g --description 'git with argv, or git status with no argv'
    if [ (count $argv) -gt 0 ]
        git $argv
    else
        git status
    end
end
