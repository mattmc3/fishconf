function speedtest --description 'Internet speed test'
    wget -O /dev/null http://speed.transip.nl/10mb.bin $argv
end
