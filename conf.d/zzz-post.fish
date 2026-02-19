#
# zzz-post: Stuff to run at the very end
#

# Add local config
set -q DOTFILES || set -gx DOTFILES $HOME/.dotfiles
if test -r $DOTFILES/.local/config/fish/config.fish
    source $DOTFILES/.local/config/fish/config.fish
end

emit fish_postinit
