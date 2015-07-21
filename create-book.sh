#! /bin/bash

rm -rf output
mkdir output
cp -r styles output/
cp -r images output/
cp hyphenator.js output/

version='version '
version+=`date +%Y.%m.%d.`
version+=`git rev-list HEAD --count`

# -f markdown: use markdown as input
# -t html: use html as output
# -o: output filename
# -s: create stand alone file
# -S: use smart quotes in output
# -N: number sections
pandoc chapter0.md chapter1.md chapter2.md chapter3.md chapter4.md chapter5.md chapter6.md chapter7.md chapterz.md \
    -f markdown \
    -t html5 \
    -o output/book.html \
    -s \
    -S \
    -N \
    --metadata="date:$version" \
    --chapters \
    -M chapters \
    --filter='/Users/bart/.cabal/bin/pandoc-crossref' \
    --css='styles/web.css' \
    --css='styles/chapter2.css' \
    --bibliography='library.bib' \
    --include-in-header='head.html'
#    --toc \

#prince output/book.html -o output/book.pdf
