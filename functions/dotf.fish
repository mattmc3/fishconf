function dotf --description 'dotfiles bare git repo'
    cd $DOTFILES

    # If using a bare repo...
    #git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME $argv
end
