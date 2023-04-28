## XDG
# See https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html

# User level dirs
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -q XDG_CACHE_HOME || set -Ux XDG_CACHE_HOME $HOME/.cache
set -q XDG_CONFIG_HOME || set -Ux XDG_CONFIG_HOME $HOME/.config
set -q XDG_DATA_HOME || set -Ux XDG_DATA_HOME $HOME/.local/share
set -q XDG_STATE_HOME || set -Ux XDG_STATE_HOME $HOME/.local/state
set -q XDG_RUNTIME_DIR || set -Ux XDG_RUNTIME_DIR $HOME/.xdg

# https://wiki.archlinux.org/index.php/XDG_user_directories
if not set -q XDG_DESKTOP_DIR
    switch (uname)
        case Darwin
            set -q XDG_DESKTOP_DIR || set -Ux XDG_DESKTOP_DIR $HOME/Desktop
            set -q XDG_DOCUMENTS_DIR || set -Ux XDG_DOCUMENTS_DIR $HOME/Documents
            set -q XDG_DOWNLOAD_DIR || set -Ux XDG_DOWNLOAD_DIR $HOME/Downloads
            set -q XDG_MUSIC_DIR || set -Ux XDG_MUSIC_DIR $HOME/Music
            set -q XDG_PICTURES_DIR || set -Ux XDG_PICTURES_DIR $HOME/Pictures
            set -q XDG_VIDEOS_DIR || set -Ux XDG_VIDEOS_DIR $HOME/Videos
            set -q XDG_PROJECTS_DIR || set -Ux XDG_PROJECTS_DIR $HOME/Projects
    end
end

# dotfiles
set -q dotfiles || set -Ux dotfiles ~/.config/dotfiles
set -q ZDOTDIR || set -Ux ZDOTDIR ~/.config/zsh

# path (app specific paths in the apps.fish file)
set -gx PATH \
    /usr/local/sbin \
    /usr/local/bin \
    /usr/sbin \
    /usr/bin \
    $HOME/bin \
    /bin

if test -d /opt/homebrew
    set -gx PATH \
        /opt/homebrew/bin \
        /opt/homebrew/sbin \
        $PATH

    set -gx MANPATH \
        /opt/homebrew/share/man \
        $MANPATH
end

# no greeting
set fish_greeting

# apps
set -q PAGER || set -gx PAGER less
set -q VISUAL || set -gx VISUAL code
set -q EDITOR || set -gx EDITOR vim

# where I store my projects
set -q PROJECTS || set -x PROJECTS ~/Projects

# add function subdirs to fish_function_path
set fish_function_path $fish_function_path $__fish_config_dir/functions/*/

# add completion subdirs to fish_completion_path
set fish_complete_path $fish_complete_path $__fish_config_dir/completions/*/

# initial working directory
set -g IWD $PWD
