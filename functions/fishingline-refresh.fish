function fishingline-refresh -d 'Refresh fishingline plugins'
    set -l fishcfg $HOME/.config/fish
    if test -d $fishcfg/fishingline
        rm -rf $fishcfg/fishingline
    end
    mkdir $fishcfg/fishingline
    cd $fishcfg/fishingline
    set -l repos \
        cd-ls \
        common-funcs \
        fish-z \
        git-right-prompt \
        gitdot \
        go \
        macos \
        python \
        safe-rm \
        sorin-prompt-enhanced \
        up
    for r in $repos
        git clone --recursive git@github.com:fishingline/$r.git
    end
end
