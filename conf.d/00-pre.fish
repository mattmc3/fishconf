# Initial fish setup
set -q fish_config; or set -gx fish_config $HOME/.config/fish

## XDG
# See https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html

# System level dirs
# set -q XDG_DATA_DIRS; or set -gx XDG_DATA_DIRS /usr/share /usr/local/share
# set -q XDG_CONFIG_DIRS; or set -gx XDG_CONFIG_DIRS /etc/xdg

# User level dirs
set -q XDG_CACHE_HOME; or set -gx XDG_CACHE_HOME $HOME/.cache
set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME $HOME/.config
set -q XDG_DATA_HOME; or set -gx XDG_DATA_HOME $HOME/.local/share
set -q XDG_RUNTIME_DIR; or set -gx XDG_RUNTIME_DIR $HOME/.xdg
set -q XDG_DESKTOP_DIR; or set -gx XDG_DESKTOP_DIR $HOME/Desktop
set -q XDG_DOWNLOAD_DIR; or set -gx XDG_DOWNLOAD_DIR $HOME/Downloads
set -q XDG_DOCUMENTS_DIR; or set -gx XDG_DOCUMENTS_DIR $HOME/Documents
set -q XDG_MUSIC_DIR; or set -gx XDG_MUSIC_DIR $HOME/Music
set -q XDG_PICTURES_DIR; or set -gx XDG_PICTURES_DIR $HOME/Pictures
set -q XDG_VIDEOS_DIR; or set -gx XDG_VIDEOS_DIR $HOME/Videos

## Misc
# add aliases to fish_function_path
set fish_function_path $XDG_CONFIG_HOME/fish/aliases $fish_function_path
set -gx PATH "/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/bin"
