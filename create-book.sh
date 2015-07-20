#! /bin/bash

rm -rf output
mkdir output
cp -r styles output/
cp hyphenator.js output/

# -f markdown: use markdown as input
# -t html: use html as output
# -o: output filename
# -s: create stand alone file
# -S: use smart quotes in output
# --toc: include table of content
# -N: number sections
# -css: add style sheet
pandoc chapter2.md \
    -f markdown \
    -t html5 \
    -o output/book.html \
    -s \
    -S \
    -N \
    --css='styles/web.css' \
    --css='styles/chapter2.css' \
    --bibliography='library.bib' \
    --include-in-header='head.html'
#    --toc \

#prince output/book.html -o output/book.pdf
