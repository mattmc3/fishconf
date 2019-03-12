function tac --description 'Reverse cat'
	cat $argv | awk '{a[NR]=$0}END{for(i=NR;i>0;i--)print a[i]}'
end
