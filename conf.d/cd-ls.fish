set -q LS_AFTER_CD || set -xg LS_AFTER_CD true

# show directory listing on directory change
function __ls_after_cd__on_variable_pwd --on-variable PWD
    if test "$LS_AFTER_CD" = true; and status --is-interactive
        ls -GF
    end
end
