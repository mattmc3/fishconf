function gen-brewfile -d 'Dump packages to the global brewfile'
    set -q local_env || set -l local_env home
    brew bundle dump --force --file $DOTFILES/local/homebrew/Brewfile.$local_env >/dev/null
end
