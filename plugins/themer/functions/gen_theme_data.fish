function gen_theme_data \
    --description "generate color scheme data file"

    # pre-reqs
    if not type yq &>/dev/null
        echo >&2 "Required tool not found 'yq'."
        return 1
    end

    # get iterm2 color scheme repo (it has a bunch of themes in alacritty yaml format)
    set -l cachedir $XDG_CACHE_HOME/repos
    set -l repo mbadolato/iTerm2-Color-Schemes
    set -l repodir $cachedir/iterm2cs

    # clone or update
    if test -d $repodir
        git -C $repodir pull --quiet
    else
        git clone --depth 1 --quiet https://github.com/$repo $repodir 2>/dev/null
    end

    # parse alacritty yaml into json pallette file
    set -l yq_query '[
        .[] |
        {"file": (filename | split("/"))[-1]} *
        .normal *
        .primary *
        (.bright | with_entries(.key |= "br" + .)) *
        (.cursor | with_entries(.key |= "cursor_" + .)) *
        (.selection | with_entries(.key |= "selection_" + .))
    ]'
    yq eval-all $argv $yq_query $repodir/alacritty/*.yml
end
