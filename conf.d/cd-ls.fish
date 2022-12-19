set -q ls_after_cd || set -xg ls_after_cd true

# show directory listing on directory change
function __ls_after_cd__on_variable_pwd --on-variable PWD
    if test "$ls_after_cd" = true; and status --is-interactive
        ls -G
    end
end
