function brewup -d 'Updates homebrew and upgrades installed packages'
    brew update && brew upgrade && brew cleanup
end
