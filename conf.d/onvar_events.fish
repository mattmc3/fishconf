# show directory listing on directory change
function ls_after_cd --on-variable PWD
    if test "$enable_ls_after_cd" = true; and status --is-interactive
        ls -G
    end
end
