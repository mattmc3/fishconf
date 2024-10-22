function brewdesc -d 'Show descriptions of brew installs'
    brew leaves |
        xargs brew desc --eval-all |
        string replace -r '^(.*:)(\s+[^\[].*)$' '$1'(set_color blue)'$2'(set_color normal)
end
