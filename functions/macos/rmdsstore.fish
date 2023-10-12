function rmdsstore -d 'Remove .DS_Store files recursively in a directory'
    test (count $argv) -gt 0 || set argv '.'
    find "$argv" -type f -name .DS_Store -delete
end
