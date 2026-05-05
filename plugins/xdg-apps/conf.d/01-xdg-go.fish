type -q go; or return 1
set -q GOPATH; or set -gx GOPATH $XDG_DATA_HOME/go
set -q GOMODCACHE; or set -gx GOMODCACHE $XDG_CACHE_HOME/go/mod
