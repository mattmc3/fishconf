function bright -a direction -d 'Make the screen bright'
    switch "$direction"
    case d down dim less
        osascript -e 'tell application "System Events"' -e 'key code 145' -e ' end tell'
    case u up more ""
        osascript -e 'tell application "System Events"' -e 'key code 144' -e ' end tell'
    end
end
