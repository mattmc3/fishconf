function dotf \
    --description 'dotfiles bare git repo'

    git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME $argv
end
