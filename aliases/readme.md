# aliases

Don't touch stuff in ~/.config/fish/aliases directly. Instead run the following:

```fish
rm ~/.config/fish/aliases/*.fish
alias_set ;and aliassave
```

Aliases should be managed via ~/.config/functions/alias_set.fish
