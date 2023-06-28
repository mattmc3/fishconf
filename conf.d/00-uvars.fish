#
# uvars - set fish universals (sparingly)
#

set -q MY_UVARS_SET
and return

# XDG base dirs
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -Ux XDG_CACHE_HOME $HOME/.cache
set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_DATA_HOME $HOME/.local/share
set -Ux XDG_STATE_HOME $HOME/.local/state
set -Ux XDG_RUNTIME_DIR $HOME/.xdg

for xdg_dir in \
    $XDG_CACHE_HOME \
    $XDG_CONFIG_HOME \
    $XDG_DATA_HOME \
    $XDG_STATE_HOME \
    $XDG_RUNTIME_DIR

    [ -d $xdg_dir ]; or mkdir -p $xdg_dir
end

set -U MY_UVARS_SET true
