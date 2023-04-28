function gpg --wraps='gpg' --description 'alias gpg command gpg --homedir "$GNUPGHOME"'
    command gpg --homedir "$GNUPGHOME" $argv
end
