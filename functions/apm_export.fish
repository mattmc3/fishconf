function apm_export --description 'Export Atom packages via apm'
    apm list --installed --bare | grep -v 'node_modules' | grep . | sort -f
end
