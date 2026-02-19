complete -c reel -x -n __fish_use_subcommand -a ls -d 'List cloned repos'
complete -c reel -x -n __fish_use_subcommand -a in -d 'Clone a repo'
complete -c reel -x -n __fish_use_subcommand -a rm -d 'Remove a cloned repo'
complete -c reel -x -n __fish_use_subcommand -a up -d 'Update a repo'
complete -c reel -x -n __fish_use_subcommand -a home -d 'Show reel\'s repo directory'

complete -c reel -x -n '__fish_seen_subcommand_from rm' -a "(reel ls)"
complete -c reel -x -n '__fish_seen_subcommand_from up' -a "(reel ls)"
