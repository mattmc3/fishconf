function showfiles -d 'Show hidden files in Finder'
    defaults write com.apple.finder AppleShowAllFiles -bool true; and killall Finder
end
