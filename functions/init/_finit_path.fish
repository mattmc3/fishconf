function _finit_path --description 'Prepend user bin dirs, keeping them first after later inits'
    set -g pre_path (path filter $HOME/bin $HOME/.local/bin)
    fish_add_path --prepend --move $pre_path

    # Homebrew, etc. push their own paths during startup; re-prepend ours after.
    function __reprepend_pre_path --on-event fish_postinit
        fish_add_path --prepend --move $pre_path
    end
end
