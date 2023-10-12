function new_mac_setup --description 'Set up a new mac'
    #
    # Homebrew
    #

    if not type -q brew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    end

    #
    # Dock
    #

    # https://developer.apple.com/documentation/devicemanagement/dock
    # System Preferences > Dock > Magnification:
    defaults write com.apple.dock magnification -bool true

    # Minimize windows into their application’s icon
    defaults write com.apple.dock minimize-to-application -bool true

    # Change minimize/maximize window effect from genie to scale
    defaults write com.apple.dock mineffect -string scale

    # move to left
    defaults write com.apple.dock orientation left

    # Don't keep a spot for recent apps
    defaults write com.apple.dock show-recents -bool false

    #
    # Finder
    #

    # Keep folders on top when sorting by name
    defaults write com.apple.finder _FXSortFoldersFirst -bool true

    #
    # Keyboard
    #

    # Use key repeat for press-and-hold
    # macOS handles pressing-and-holding of keys differently than I'd like.
    # Instead of the default, let's change it to repeat the key being pressed.

    # Disable press-and-hold for keys in favor of key repeat
    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

    # Or, do this for individual apps
    defaults write com.sublimetext.4 ApplePressAndHoldEnabled -bool false
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

    # If you need to reset back to default:
    # defaults delete -g ApplePressAndHoldEnabled

    # Speed of key Repeat/Delay
    defaults write -g InitialKeyRepeat -int 25
    defaults write -g KeyRepeat -int 2

    #
    # Mouse
    #

    # Accessibility > Display > Cursor : Increase pointer size
    sudo defaults write com.apple.universalaccess mouseDriverCursorSize 1.8

    #
    # Security & Privacy
    #

    # Turn Firewall on
    # sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

    #
    # Screenshots
    #

    mkdir -p "$HOME/Screenshots"
    defaults write com.apple.screencapture location -string "$HOME/Screenshots"

    #
    # Screen Saver
    #

    # 0: no-op
    # 2: Mission Control
    # 3: Show application windows
    # 4: Desktop
    # 5: Start screen saver
    # 6: Disable screen saver
    # 7: Dashboard
    # 10: Put display to sleep
    # 11: Launchpad
    # 12: Notification Center

    # bottom right corner starts screen saver
    defaults write com.apple.dock wvous-br-corner -int 5
    defaults write com.apple.dock wvous-br-modifier -int 0

    #
    # Restart
    #

    set --local macapps \
        "Activity Monitor" \
        "Address Book" \
        Calendar \
        cfprefsd \
        Contacts \
        Dock \
        Finder \
        Mail \
        Messages \
        Photos \
        Safari \
        SystemUIServer \
        Terminal \
        iCal
    for app in $macapps
        killall $app &>/dev/null
    end
    return 0
end
