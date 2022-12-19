function grep --wraps='command grep --color=auto --exclude-dir={.git,.hg,.svn}' --description 'alias grep command grep --color=auto --exclude-dir={.git,.hg,.svn}'
    command grep --color=auto --exclude-dir={.git,.hg,.svn} $argv
end
