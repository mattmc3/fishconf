function dotf \
    --description 'dotfiles bare git repo'

    set -q dotfiles || set -U dotfiles $HOME/.config/dotfiles
    cd $dotfiles
    #git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME $argv
end
