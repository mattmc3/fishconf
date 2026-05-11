type -q bundle; or return 1
set -q BUNDLE_USER_CONFIG; or set -gx BUNDLE_USER_CONFIG $XDG_CONFIG_HOME/bundle
set -q BUNDLE_USER_CACHE; or set -gx BUNDLE_USER_CACHE $XDG_CACHE_HOME/bundle
set -q BUNDLE_USER_PLUGIN; or set -gx BUNDLE_USER_PLUGIN $XDG_DATA_HOME/bundle
