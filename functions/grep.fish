function grep
	command grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} $argv
end
