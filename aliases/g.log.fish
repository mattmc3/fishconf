# Defined in - @ line 1
function g.log --description 'alias g.log git log --oneline --decorate --graph --all'
    git log --oneline --decorate --graph --all $argv;
end
