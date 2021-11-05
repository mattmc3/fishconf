# fishconf

My fish shell configuration

## Install

```fish
# get the repo
test -d ~/.config/fish && mv ~/.config/fish ~/.config/fish.bak
git clone git@github.com:mattmc3/fishconf ~/.config/fish
fish

# update plugins
fisher update

# select color scheme - I like Nord
fish_config
```

## Prompts

* [pure]
* [spacefish]

## Installation

```fish
git clone --recursive git@github.com:mattmc3/fishconf ~/.config/fish
fish
fish_config
fisher
```

[fishingline]: https://github.com/fishingline
[fzf]: https://github.com/jethrokuan/fzf
[pure]: https://github.com/rafaelrinaldi/pure
[spacefish]: https://github.com/matchai/spacefish
