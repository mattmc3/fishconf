function dotty \
    --description 'dotfiles bare git repo'

    GIT_WORK_TREE=~ GIT_DIR=~/.mydotfiles $argv
end
