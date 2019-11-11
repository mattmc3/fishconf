# Defined in - @ line 1
function brewup --description 'alias brewup brew update && brew upgrade'
    brew update && brew upgrade $argv;
end
