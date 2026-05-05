if test -n "$HOMEBREW_OWNER"; and test (whoami) != "$HOMEBREW_OWNER"
    function brew
        command sudo -Hu $HOMEBREW_OWNER brew $argv
    end
end
