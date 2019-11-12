function vscode_import --description 'Import extentions into vscode'
    if not test -f "$argv"
        echo "Usage: Expecting valid extensions file path" >&2
        return
    end
    cat "$argv" | xargs -L 1 code --install-extension
end
