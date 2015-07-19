#! /bin/bash

rm -rf output
mkdir output
cp -r styles output/

# -f markdown: use markdown as input
# -t html: use html as output
# -o: output filename
# -s: create stand alone file
# -S: use smart quotes in output
# --toc: include table of content
# -N: number sections
# -css: add style sheet
pandoc test.md \
    -f markdown \
    -t html5 \
    -o output/book.html \
    -s \
    -S \
    --toc \
    -N \
    --css='styles/html.css'

#prince output/book.html -o output/book.pdf
