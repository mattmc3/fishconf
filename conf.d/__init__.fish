#
# __init__: Anything that needs to be first.
#

# initialize
__init__ xdg
__init__ cache
__init__ manpath
__init__ fnpath
__init__ path
__init__ events
__init__ fisher
__init__ homebrew

# Other vars
set -g OSTYPE (uname -s | string lower)
set -gx DOTFILES $HOME/.dotfiles
set -gx MY_PROJECTS $HOME/Projects
