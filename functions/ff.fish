function ff --description 'find file'
	find . -not \( -name ".git/" -prune \) -type f -name "*$argv*"
end
