# Defined in - @ line 1
function brewup --description 'alias brewup brew update ;and brew upgrade'
    brew update ;and brew upgrade $argv;
end
