# https://github.com/matchai/spacefish/blob/master/docs/Options.md
function prompt_default
	set -xg PROMPT_STYLE "default"
	set -xg SHOW_RIGHT_PROMPT true
	set -xg LS_AFTER_CD true
	set -xg fish_prompt_pwd_dir_length 1

	set -xg SPACEFISH_CHAR_SYMBOL "><>"
	set -xg SPACEFISH_DIR_TRUNC 1
	set -xg SPACEFISH_DIR_TRUNC_REPO false

	set -xg SPACEFISH_BATTERY_SHOW true
	set -xg SPACEFISH_BATTERY_THRESHOLD 30
	set -xg SPACEFISH_DIR_SHOW true
	set -xg SPACEFISH_EXEC_TIME_SHOW true
	set -xg SPACEFISH_GIT_BRANCH_SHOW true
	set -xg SPACEFISH_HOST_SHOW true
	set -xg SPACEFISH_PACKAGE_SHOW true
	set -xg SPACEFISH_PROMPT_ADD_NEWLINE true
	set -xg SPACEFISH_PROMPT_PREFIXES_SHOW true
	set -xg SPACEFISH_PROMPT_SUFFIXES_SHOW true
	set -xg SPACEFISH_PROMPT_SEPARATE_LINE true
	set -xg SPACEFISH_GIT_SHOW true
	set -xg SPACEFISH_TIME_SHOW true
	set -xg SPACEFISH_USER_SHOW true
end
prompt_default

# show directory listing on directory change
function echo_dir --on-variable PWD
	# echo "you are here: $PWD"
	if test "$LS_AFTER_CD" = true
		ls -GF
	end
end
