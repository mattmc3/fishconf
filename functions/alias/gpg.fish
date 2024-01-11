function gpg --wraps='gpg' --description 'alias gpg command gpg --homedir "$GNUPGHOME"'
    set -q GNUPGHOME; or set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
    test -d $GNUPGHOME; or mkdir -p $GNUPGHOME
    command gpg --homedir "$GNUPGHOME" $argv
end
