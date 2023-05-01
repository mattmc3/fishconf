function dotf \
    --description 'dotfiles bare git repo'

    set -q dotfiles || set -gx dotfiles $HOME/.config/dotfiles
    cd $DOTFILES
    #git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME $argv
end
