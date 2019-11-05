function speedtest --description 'alias speedtest wget -O /dev/null http://speed.transip.nl/10mb.bin'
    wget -O /dev/null http://speed.transip.nl/10mb.bin $argv;
end
