function wget --wraps='wget"' --description 'alias wget command wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
    command wget --hsts-file="$XDG_CACHE_HOME/wget-hsts" $argv
end
