# Defined in - @ line 1
function genpass --description 'alias genpass openssl rand -base64 32'
    openssl rand -base64 32 $argv;
end
