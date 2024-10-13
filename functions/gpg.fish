function gpg --wraps='gpg' --description 'alias gpg command gpg --homedir "$GNUPGHOME"'
    set --local gpg_home $GNUPGHOME
    if not set -q GNUPGHOME
        set -q XDG_DATA_HOME
        and set gpg_home $XDG_DATA_HOME/gnupg
        or set gpg_home $HOME/.local/share/gnupg
    end
    command gpg --homedir $gpg_home $argv
end
