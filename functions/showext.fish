function showext --description 'Show extension from path'
    set --local file
    for file in $argv
        set --local ext
        while test (path extension $file) != ""
            set ext (path extension $file) $ext
            set file (path change-extension '' $file)
        end
        string join '' $ext
    end
end
