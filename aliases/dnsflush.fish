# Defined in - @ line 1
function dnsflush --description 'alias dnsflush dscacheutil -flushcache && killall -HUP mDNSResponder'
    dscacheutil -flushcache && killall -HUP mDNSResponder $argv;
end
