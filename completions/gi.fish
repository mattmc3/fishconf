function __gitignoreio_topics
    curl -sfL https://www.toptal.com/developers/gitignore/api/list | tr "," "\n"
end

complete --exclusive --command gi --arguments "(__gitignoreio_topics)"
