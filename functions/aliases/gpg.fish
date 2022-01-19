# Defined via `source`
function gpg --wraps='command gpg --homedir "$GNUPGHOME"' --description 'alias gpg command gpg --homedir "$GNUPGHOME"'
    command gpg --homedir "$GNUPGHOME" $argv
end
