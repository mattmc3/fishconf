function alias_set --description 'Set common aliases'
    # single key
    alias c clear
    alias h history
    alias l 'ls -GF'
    alias v vim

    # better built-ins
    alias grep 'command grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
    alias ls 'ls -GF'
    alias rm 'safe-rm'

    # dates
    alias ds 'date +%Y-%m-%d'
    alias ts 'date +%Y%m%d%H%M%S'
    alias ymd 'ds date +%Y%m%d'
    alias ymddash 'ds date +%Y-%m-%d'

    # brew
    alias brewup 'brew update && brew upgrade'
    alias caskup 'brew cu -af'

    # git
    alias g.log 'git log --oneline --decorate --graph --all'

    # imaging
    alias autorotate 'jhead -autorot'

    # ls shortcuts
    alias la 'ls -laGFh'
    alias ll 'ls -lGFh'
    alias lsa 'ls -aGF'
    alias ldot 'ls -ld .*'

    # networking
    alias dnsflush 'dscacheutil -flushcache && killall -HUP mDNSResponder'
    alias ping 'ping -c 5'
    alias pinging ping
    alias speedtest 'wget -O /dev/null http://speed.transip.nl/10mb.bin'

    # python
    alias juno 'jupyter notebook'
    alias py python3
    alias py2 python2
    alias py3 python3

    # xdg support
    alias gpg 'command gpg2 --homedir "$GNUPGHOME"'
    alias wget 'command wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
    alias tmux 'command tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'

    # misc
    alias del safe-rm
    alias genpass 'openssl rand -base64 32'
    alias md mkdir
    alias nv nvim
    alias tarls 'tar -tvf'
    alias untar 'tar -xf'
    alias zz exit
end
