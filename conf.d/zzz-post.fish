#
# zzz-post: Stuff to run at the very end
#

# Add local config
set -q DOTFILES; or set -gx DOTFILES $HOME/.dotfiles
if test -r $DOTFILES/.local/config/fish/config.fish
    source $DOTFILES/.local/config/fish/config.fish
end

# Clean cache in background
clean_cache > /dev/null 2>&1 &

emit fish_postinit
