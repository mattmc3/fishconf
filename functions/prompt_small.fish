# https://github.com/matchai/spacefish/blob/master/docs/Options.md
function prompt_small
	set -xg PROMPT_STYLE "small"
	set -xg SHOW_RIGHT_PROMPT true
	set -xg LS_AFTER_CD false
	set -xg fish_prompt_pwd_dir_length 1

	set -xg SPACEFISH_BATTERY_SHOW true
	set -xg SPACEFISH_BATTERY_THRESHOLD 30
	set -xg SPACEFISH_DIR_SHOW true
	set -xg SPACEFISH_EXEC_TIME_SHOW false
	set -xg SPACEFISH_GIT_BRANCH_SHOW true
	set -xg SPACEFISH_HOST_SHOW false
	set -xg SPACEFISH_PACKAGE_SHOW false
	set -xg SPACEFISH_PROMPT_ADD_NEWLINE false
	set -xg SPACEFISH_PROMPT_PREFIXES_SHOW true
	set -xg SPACEFISH_PROMPT_SUFFIXES_SHOW true
	set -xg SPACEFISH_PROMPT_SEPARATE_LINE false
	set -xg SPACEFISH_GIT_SHOW true
	set -xg SPACEFISH_TIME_SHOW false
	set -xg SPACEFISH_USER_SHOW true
end
