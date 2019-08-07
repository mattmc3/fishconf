function benchmark --description 'benchmark fish'
    echo "running /usr/local/bin/fish 10 times..."
    for i in (seq 10)
        /usr/bin/time /usr/local/bin/fish -i -c exit
    end
end
