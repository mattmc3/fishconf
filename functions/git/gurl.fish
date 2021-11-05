function gurl --description 'Creates a git URL'
    set -l options h/help 'p/protocol=' 's/server=' 'u/user=' 'r/repo='
    set -l usage "usage: "(status function)" $options"

    argparse --name=(status function) $options -- $argv
    if [ $status -ne 0 ]; or set -q _flag_help
        echo $usage
        return
    end

    if not set -q DEFAULT_GIT_SERVER
        set -g DEFAULT_GIT_SERVER "github.com"
    end

    set -q _flag_p; and set protocol $_flag_p; or set protocol git
    set -q _flag_s; and set server $_flag_s; or set server $DEFAULT_GIT_SERVER
    set -q _flag_u; and set user $_flag_u; or set user (git config user.name)
    set -q _flag_r; and set repo $_flag_r; or set repo $argv

    # optionally, repo can be in the form protocol/server/user/repo
    set repo_parts (string split "/" "$repo")
    test (count $repo_parts) -eq 4; and set protocol $repo_parts[1]; and set repo_parts $repo_parts[2..-1]
    test (count $repo_parts) -eq 3; and set server $repo_parts[1]; and set repo_parts $repo_parts[2..-1]
    test (count $repo_parts) -eq 2; and set user $repo_parts[1]; and set repo_parts $repo_parts[2..-1]
    test (count $repo_parts) -eq 1; and set repo $repo_parts[1]

    # expand server abbreviations
    switch $server
        case bb
            set server "bitbucket.org"
        case gh
            set server "github.com"
        case gl
            set server "gitlab.com"
    end

    # complete the url
    # https://gitsite.com/user/repo.git or git@gitsite.com:user/repo.git
    switch $protocol
        case ssl https
            set url "https://$server/"
        case ssh git
            set url "git@$server:"
        case '*'
            echo "Bad protocol value provided: $protocol" >&2
            return 1
    end

    # remove .git suffix
    set repo (string replace -i -r '\.git$' '' $repo)
    [ -n "$repo" ]; or set repo your-repo-name-here

    echo "$url$user/$repo.git"
end
