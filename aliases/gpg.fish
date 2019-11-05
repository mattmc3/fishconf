# Defined in - @ line 1
function gpg --description 'alias gpg command gpg2 --homedir "$GNUPGHOME"'
    command gpg2 --homedir "$GNUPGHOME" $argv;
end
