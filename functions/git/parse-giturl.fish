function parse-giturl -a giturl --description 'parse a git url into protocol, domain, user, repo_name'
    if test (count $argv) -lt 1
        echo "parse-giturl: Expecting a git url argument" >&2
        return 1
    end

    # set defaults
    set -q GIT_PROTOCOL; or set GIT_PROTOCOL git@
    set -q GIT_USER; or set GIT_USER mattmc3
    set -q GIT_DOMAIN; or set GIT_DOMAIN github.com
    set -l git_sep /
    if test $GIT_PROTOCOL = "git@"
        set git_sep ":"
    end

    # https://github.com/mattmc3/dotfiles.git
    set -l re_giturl '^((?:https?|git|ssh):\/\/)(.+?)\/([^\/:]+?)\/([^\/]+?)(?:\.git)?$'
    # git@github.com:mattmc3/dotfiles.git
    set -l re_giturl2 '^(git@)([^:]+):([^\/]+)\/([^\/]+)(?:\.git)?$'
    # mattmc3/dotfiles
    set -l re_gitrepo '^([^\/]+)\/([^\/]+)$'
    # dotfiles
    set -l re_gitrepo2 '^([^\/]+)$'

    if set -l parsed (string match -r $re_giturl $giturl)
        string join \n $parsed
    else if set -l parsed (string match -r $re_giturl2 $giturl)
        string join \n $parsed
    else if set -l parsed (string match -r $re_gitrepo $giturl)
        string join \n (string join "" $GIT_PROTOCOL $GIT_DOMAIN $git_sep $giturl) $GIT_PROTOCOL $GIT_DOMAIN $parsed[2..]
    else if set -l parsed (string match -r $re_gitrepo2 $giturl)
        string join \n (string join "" $GIT_PROTOCOL $GIT_DOMAIN $git_sep $GIT_USER / $giturl) $GIT_PROTOCOL $GIT_DOMAIN $GIT_USER $parsed[2..]
    else
        return 1
    end
end
