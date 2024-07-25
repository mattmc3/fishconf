function dotf --description 'dotfiles bare git repo'
    set -q DOTFILES || set -Ux DOTFILES $HOME/.dotfiles
    cd $DOTFILES

    # If using a bare repo...
    #git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME $argv
end
