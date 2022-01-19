# aliases are slow to declare in fish, but hella convenient

# This method gives us the best of both worlds by allowing us to declare aliases here,
# but save them in the functions/aliases folder for deferred loading.
# Thus, this won't run on every init of fish.
# To reset aliases, simply delete the functions/aliases folder and restart fish

set -q aliasdir || set -g aliasdir $__fish_config_dir/functions/aliases
test -d $aliasdir && exit

# better built-ins
alias grep 'command grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias ls 'ls -G'
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

# save aliases
mkdir -p $aliasdir
for a in (alias | awk '{print $2}')
    if string match --quiet 'fish_*' $a
        continue
    end
    functions $a >$__fish_config_dir/functions/aliases/$a.fish
end
fish_indent -w $__fish_config_dir/functions/aliases/*.fish
