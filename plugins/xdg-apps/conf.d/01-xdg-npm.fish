type -q npm; or return 1
set -q NPM_CONFIG_USERCONFIG; or set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -q NPM_CONFIG_CACHE; or set -gx NPM_CONFIG_CACHE $XDG_CACHE_HOME/npm
