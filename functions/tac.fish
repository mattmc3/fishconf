function tac --description 'Reverse cat'
    if type -q tac
        tac $argv
    else
        cat $argv | awk '{a[NR]=$0}END{for(i=NR;i>0;i--)print a[i]}'
    end
end
