function flushdns -d 'Flush DNS cache'
    dscacheutil -flushcache && sudo killall -HUP mDNSResponder
end
