function dotf \
    --description 'dotfiles bare git repo'

    set -q DOTFILES || set -U DOTFILES $HOME/.config/dotfiles
    cd $DOTFILES
    #git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME $argv
end
