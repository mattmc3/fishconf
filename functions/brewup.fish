function brewup -d 'Update homebrew, upgrade installed packages, and cleanup'
    brew update; and brew upgrade; and brew cleanup
end
