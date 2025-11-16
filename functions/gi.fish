function gi --description "Create gitignore"
    set --local topics (string join "," $argv)
    curl -fLw '\n' https://www.toptal.com/developers/gitignore/api/$topics
end
