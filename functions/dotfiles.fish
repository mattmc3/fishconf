function dotfiles \
    --description 'dotfiles bare git repo'

    git --git-dir=$HOME/.mydotfiles --work-tree=$HOME $argv
end
