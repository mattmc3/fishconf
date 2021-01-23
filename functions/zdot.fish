function zdot -d "Go to my $ZDOTDIR"
    set -q ZDOTDIR || set -U ZDOTDIR ~/.config/zsh
    cd $ZDOTDIR
end
