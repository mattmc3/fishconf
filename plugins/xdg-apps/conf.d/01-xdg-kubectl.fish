type -q kubectl; or return 1
set -q KUBECONFIG; or set -gx KUBECONFIG $XDG_CONFIG_HOME/kube/config
set -q KUBECACHEDIR; or set -gx KUBECACHEDIR $XDG_CACHE_HOME/kube
