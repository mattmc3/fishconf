function gpg --description 'alias gpg=gpg2 --homedir "$GNUPGHOME"'
    gpg2 --homedir "$GNUPGHOME" $argv;
end
