# single key
alias c=clear
alias h=history
alias l='ls -GF'
alias v=vim
alias nv=nvim

# better built-ins
alias grep='command grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias ls='ls -GF'

# dates
alias ds='date +%Y-%m-%d'
alias ts='date +%Y%m%d%H%M%S'
alias ymd='ds date +%Y%m%d'
alias ymddash='ds date +%Y-%m-%d'

# git
alias g.log='git log --oneline --decorate --graph --all'
alias g.pristine='git reset --hard && git clean -dfx'
alias g.branchname='git rev-parse --abbrev-ref HEAD'

# imaging
alias autorotate='jhead -autorot'

# ls shortcuts
alias la='ls -laGFh'
alias ll='ls -lGFh'
alias lsa='ls -aGF'
alias ldot='ls -ld .*'

# networking
alias ping='ping -c 5'
alias pinging="command ping"
alias speedtest='wget -O /dev/null http://speed.transip.nl/10mb.bin'

# misc
alias genpass='openssl rand -base64 32'
alias md=mkdir
alias nv=nvim
alias tarls='tar -tvf'
alias untar='tar -xf'
alias zz=exit

# editors
alias te='$EDITOR .'
alias ide='$VISUAL .'

# quick dirs
alias dotf='cd $DOTFILES'
alias zdot='cd $ZDOTDIR'
alias fconf='cd $__fish_config_dir'
