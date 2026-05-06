function __init__path --description 'Prepend user bin dirs to PATH'
    set -g pre_path (
        path filter \
            $HOME/bin \
            $HOME/.local/bin
    )
    fish_add_path --prepend --move $pre_path

    # Re-prepend after other inits (homebrew, fisher) push their own.
    function _init_post --on-event fish_postinit
        fish_add_path --prepend --move $pre_path
    end
end
