# aliases are slower than functions, but convenient to declare en masse

# better built-ins
alias grep 'command grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias ls 'ls -GF'
alias ping 'ping -c 5'

# imaging
alias autorotate 'jhead -autorot'

# networking
alias pinging 'command ping'
alias speedtest 'wget -O /dev/null http://speed.transip.nl/10mb.bin'

# misc
alias j15 'set -q JAVA_HOME (/usr/libexec/java_home -v 15); java -version'
alias genpass 'openssl rand -base64 32'
alias md mkdir

# editors
alias te '$EDITOR .'
alias ide '$VISUAL .'

# xdg
alias gpg 'command gpg --homedir "$GNUPGHOME"'
alias tmux 'command tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
alias wget 'command wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
