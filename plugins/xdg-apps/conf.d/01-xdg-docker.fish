type -q docker; or return 1
set -q DOCKER_CONFIG; or set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
