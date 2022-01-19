# Defined via `source`
function genpass --wraps='openssl rand -base64 32' --description 'alias genpass openssl rand -base64 32'
    openssl rand -base64 32 $argv
end
