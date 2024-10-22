function hidefiles -d 'Hide the normally hidden dotfiles in Finder'
    defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder
end
