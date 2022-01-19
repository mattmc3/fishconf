# Defined via `source`
function speedtest --wraps='wget -O /dev/null http://speed.transip.nl/10mb.bin' --description 'alias speedtest wget -O /dev/null http://speed.transip.nl/10mb.bin'
    wget -O /dev/null http://speed.transip.nl/10mb.bin $argv
end
