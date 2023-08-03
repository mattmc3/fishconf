#
# abbrs
#

set -q MY_ABBRS_INITIALIZED; and return

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
abbr -a -- fconf 'cd $__fish_config_dir'
abbr -a -- fishconf 'cd $__fish_config_dir'
abbr -a -- fdot 'cd $__fish_config_dir'
abbr -a -- zdot 'cd $ZDOTDIR'

# date/time
abbr -a -- ds 'date +%Y-%m-%d'
abbr -a -- ts 'date +%Y-%m-%dT%H:%M:%SZ'
abbr -a -- yyyymmdd 'date +%Y%m%d'

# git
# abbr -a -- gad 'git add'
# abbr -a -- gbn 'git rev-parse --abbrev-ref HEAD'
# abbr -a -- gcl 'git clean'
# abbr -a -- gcmt 'git commit -am '
# abbr -a -- gco 'git checkout'
# abbr -a -- gcob 'git checkout -b '
# abbr -a -- gcod 'git checkout develop'
# abbr -a -- gcom 'git checkout master'
# abbr -a -- get git
# abbr -a -- glg 'git log'
# abbr -a -- glog git\ log\ --Uraph\ --pretty=\'\%Cred\%h\%Creset\ -\%C\(auto\)\%d\%Creset\ \%s\ \%Cgreen\(\%ad\)\ \%C\(bold\ blue\)\<\%an\>\%Creset\'\ --date=short
# abbr -a -- gpll 'git pull'
# abbr -a -- gpristine 'git reset --hard && git clean -fdx'
# abbr -a -- gpsh 'git push'
# abbr -a -- gpsuo 'git push --set-Upstream origin (git rev-parse --abbrev-ref HEAD)'
# abbr -a -- grm 'git rm'
# abbr -a -- grv 'git remote -v'
# abbr -a -- gsh 'git stash'
# abbr -a -- gst 'git status -sb'
abbr -a -- gclone 'git clone git@github.com:mattmc3/'
abbr -a -- gwhoami 'echo "user.name:" (git config user.name) && echo "user.email:" (git config user.email)'

# no need to run over-and-over
set -g MY_ABBRS_INITIALIZED true
