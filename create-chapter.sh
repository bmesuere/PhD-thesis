#! /bin/bash

rm -rf output
mkdir output
cp -r styles output/
cp -r images output/
cp hyphenator.js output/

version='version x'

pandoc chapter3.md \
    -f markdown \
    -t html5 \
    -o output/web.html \
    -s \
    -S \
    -N \
    --metadata="date:$version" \
    --number-sections \
    --section-divs \
    --chapters \
    -M chapters \
    --filter='/Users/bart/.cabal/bin/pandoc-crossref' \
    --css='styles/web.css' \
    --css='styles/chapter2.css' \
    --bibliography='library.bib' \
    --include-in-header='head.html' \
