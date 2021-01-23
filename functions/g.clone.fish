function g.clone --description 'git clone with some great extras'
    if [ (count $argv) -ge 1 ]
        set -l repo $argv[-1]
        set -l repo_parts (string split "/" $repo)
        switch (count $repo_parts)
            case 1
                set repo "git@github.com:mattmc3/$repo.git"
            case 2
                set repo "https://github.com/$repo"
        end
        command git clone $argv[1..-2] $repo
    else
        command git clone $argv
    end
end
