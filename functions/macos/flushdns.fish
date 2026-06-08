function flushdns -d 'Flush DNS cache'
    dscacheutil -flushcache; and sudo killall -HUP mDNSResponder
end
