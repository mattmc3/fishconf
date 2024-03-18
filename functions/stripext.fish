function stripext --description 'Strip extension from path'
    set --local file
    for file in $argv
        while test (path extension $file) != ""
            set file (path change-extension '' $file)
        end
        echo $file
    end
end
