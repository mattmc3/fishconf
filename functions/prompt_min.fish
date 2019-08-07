# https://github.com/matchai/spacefish/blob/master/docs/Options.md
function prompt_min
    set -xg PROMPT_STYLE "min"
    set -xg SHOW_RIGHT_PROMPT false
    set -xg LS_AFTER_CD false
    set -xg fish_prompt_pwd_dir_length 1

    set -xg SPACEFISH_BATTERY_SHOW false
    set -xg SPACEFISH_DIR_SHOW false
    set -xg SPACEFISH_EXEC_TIME_SHOW false
    set -xg SPACEFISH_GIT_BRANCH_SHOW false
    set -xg SPACEFISH_HOST_SHOW false
    set -xg SPACEFISH_PACKAGE_SHOW false
    set -xg SPACEFISH_PROMPT_ADD_NEWLINE false
    set -xg SPACEFISH_PROMPT_PREFIXES_SHOW false
    set -xg SPACEFISH_PROMPT_SEPARATE_LINE false
    set -xg SPACEFISH_GIT_SHOW false
    set -xg SPACEFISH_TIME_SHOW false
    set -xg SPACEFISH_USER_SHOW false
end
