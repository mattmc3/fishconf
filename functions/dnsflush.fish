# Defined in - @ line 0
function dnsflush --description 'alias dnsflush dscacheutil -flushcache; and killall -HUP mDNSResponder'
    dscacheutil -flushcache; and killall -HUP mDNSResponder $argv;
end
