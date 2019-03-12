function fd --description 'find directory'
	find . -not \( -name ".git/" -prune \) -type d -name "*$argv*"
end
