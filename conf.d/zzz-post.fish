#
# zzz-post: Stuff to run at the very end
#

# Make sure our prepath is always at the beginning
fish_add_path --prepend --move $pre_path

# Add local config
set -q DOTFILES; or set -gx DOTFILES $HOME/.dotfiles
if test -r $DOTFILES/.local/config/fish/config.fish
    source $DOTFILES/.local/config/fish/config.fish
end
