# Defined via `source`
function grep --wraps='command grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}' --description 'alias grep command grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
    command grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} $argv
end
