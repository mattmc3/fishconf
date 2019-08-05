set -q LS_AFTER_CD; or set -xg LS_AFTER_CD true

# show directory listing on directory change
function __ls_after_cd__on_variable_pwd --on-variable PWD
	# echo "you are here: $PWD"
	if test "$LS_AFTER_CD" = true
		ls -GF
	end
end
