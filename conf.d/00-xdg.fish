## XDG
# See https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html

# System level dirs
# set -q XDG_DATA_DIRS; or set -gx XDG_DATA_DIRS /usr/share /usr/local/share
# set -q XDG_CONFIG_DIRS; or set -gx XDG_CONFIG_DIRS /etc/xdg

# User level dirs
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -q XDG_CACHE_HOME; or set -U XDG_CACHE_HOME $HOME/.cache
set -q XDG_CONFIG_HOME; or set -U XDG_CONFIG_HOME $HOME/.config
set -q XDG_DATA_HOME; or set -U XDG_DATA_HOME $HOME/.local/share
set -q XDG_RUNTIME_DIR; or set -U XDG_RUNTIME_DIR $HOME/.xdg

# https://wiki.archlinux.org/index.php/XDG_user_directories
if not set -q XDG_DESKTOP_DIR
    switch (uname)
        case Darwin
            set -q XDG_DESKTOP_DIR; or set -U XDG_DESKTOP_DIR $HOME/Desktop
            set -q XDG_DOCUMENTS_DIR; or set -U XDG_DOCUMENTS_DIR $HOME/Documents
            set -q XDG_DOWNLOAD_DIR; or set -U XDG_DOWNLOAD_DIR $HOME/Downloads
            set -q XDG_MUSIC_DIR; or set -U XDG_MUSIC_DIR $HOME/Music
            set -q XDG_PICTURES_DIR; or set -U XDG_PICTURES_DIR $HOME/Pictures
            set -q XDG_VIDEOS_DIR; or set -U XDG_VIDEOS_DIR $HOME/Videos
            set -q XDG_PROJECTS_DIR; or set -U XDG_PROJECTS_DIR $HOME/Projects
    end
end
