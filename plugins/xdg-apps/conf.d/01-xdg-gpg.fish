type -q gpg; or return 1
set -q GNUPGHOME; or set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
mkdir -p $GNUPGHOME
