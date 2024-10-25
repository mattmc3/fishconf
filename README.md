# fishconf

My fish shell configuration

## Installation

```fish
# get the repo
test -d ~/.config/fish && mv ~/.config/fish ~/.config/fish.bak
git clone git@github.com:mattmc3/fishconf ~/.config/fish
fish

# select color scheme - I like Nord or Tomorrow Night
fish_config
```

## Performance

A snappy shell is very important to me. My config includes a `benchmark` function that
runs fish 10 times and presents the timings.

The latest benchmark run shows that we load a new shell pretty fast.

```fish
$ # MacBook Air (M3, 2024)
$ set fprof (mktemp)
$ fish --profile-startup=$fprof -c exit
$ awk 'NR==1 || $3==">"{print}' $fprof | string replace $HOME '~'
$ rm $fprof
Time    Sum     Command
274     6595    > builtin source /opt/homebrew/Cellar/fish/3.7.1/share/fish/config.fish
13      13      > builtin source /opt/homebrew/etc/fish/config.fish
74      8572    > builtin source /Users/matt/.config/fish/config.fish

$ for i in (seq 1 10); /usr/bin/time fish -i -c exit; end
        0.02 real         0.01 user         0.01 sys
        0.01 real         0.01 user         0.00 sys
        0.01 real         0.00 user         0.00 sys
        0.01 real         0.00 user         0.00 sys
        0.01 real         0.00 user         0.00 sys
        0.01 real         0.00 user         0.00 sys
        0.01 real         0.00 user         0.00 sys
        0.01 real         0.00 user         0.00 sys
        0.01 real         0.00 user         0.00 sys
        0.01 real         0.00 user         0.00 sys
```

You can also profile fish's startup with the following command:

```fish
fish --profile-startup=$__fish_config_dir/fishprof.txt -c "exit"
```


[fishingline]: https://github.com/fishingline
[fzf]: https://github.com/jethrokuan/fzf
[pure]: https://github.com/rafaelrinaldi/pure
[spacefish]: https://github.com/matchai/spacefish
