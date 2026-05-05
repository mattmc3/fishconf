function brewinfo -d "Show brewed formulae and descriptions"
    brew leaves | xargs brew desc --eval-all
end
