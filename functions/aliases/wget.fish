# Defined via `source`
function wget --wraps='command wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"' --description 'alias wget command wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
    command wget --hsts-file="$XDG_CACHE_HOME/wget-hsts" $argv
end
