# show directory listing on directory change
function ls_after_cd --on-variable PWD
    if status --is-interactive
        ls -G
    end
end
