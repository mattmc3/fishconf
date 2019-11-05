# Defined in - @ line 1
function grep --description 'alias grep command grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
    command grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} $argv;
end
