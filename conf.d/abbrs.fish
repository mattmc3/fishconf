#
# abbrs
#

set -q MY_ABBRS_INITIALIZED && return

abbr -a -- - 'cd -'
abbr -a -- nv nvim
abbr -a -- tarls 'tar -tvf'
abbr -a -- untar 'tar -xv'
abbr -a -- zz exit

# single key
abbr -a -- c clear
abbr -a -- h history
abbr -a -- l 'ls -UF'

# better ls
abbr -a -- la 'ls -lah'
abbr -a -- ldot 'ls -ld .*'
abbr -a -- ll 'ls -lGFh'
abbr -a -- lsa 'ls -aGF'

# quick nav
abbr -a -- fdot 'cd $__fish_config_dir'
abbr -a -- zdot 'cd $ZDOTDIR'

# date/time
abbr -a -- ds 'date +%Y-%m-%d'
abbr -a -- ts 'date +%Y-%m-%dT%H:%M:%SZ'
abbr -a -- isodate 'date +%Y-%m-%dT%H:%M:%S%z'
abbr -a -- unixepoch 'date +%s'
abbr -a -- yyyymmdd 'date +%Y%m%d'

# disk usage
abbr -a -- dud 'du -d 1 -h'
abbr -a -- duf 'du -sh *'
abbr -a -- dux 'du -x --max-depth=1 | sort -n'

# misc
abbr -a -- please sudo
abbr -a -- print-path 'string join \n $PATH'

# git
abbr -a -- gclone 'git clone git@github.com:mattmc3/'
abbr -a -- gwhoami 'echo "user.name:" (git config user.name) && echo "user.email:" (git config user.email)'

# no need to run over-and-over
set -g MY_ABBRS_INITIALIZED true
