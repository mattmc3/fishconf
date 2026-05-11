type -q gem; or return 1
set -q GEM_HOME; or set -gx GEM_HOME $XDG_DATA_HOME/gem
set -q GEM_SPEC_CACHE; or set -gx GEM_SPEC_CACHE $XDG_CACHE_HOME/gem
