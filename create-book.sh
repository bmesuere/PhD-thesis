#! /bin/bash

rm -rf output
mkdir output
cp -r styles output/
cp -r images output/
cp hyphenator.js output/

version='version '
version+=`date +%Y.%m.%d-`
version+=`git rev-list HEAD --count`

pandoc chapter0.md chapter1.md chapter2.md chapter3.md chapter4.md chapter5.md chapter6.md chapterz.md \
    -f markdown \
    -t html5 \
    -o output/web.html \
    -s \
    -S \
    -N \
    --number-sections \
    --section-divs \
    --chapters \
    -M chapters \
    --filter='/Users/bart/.cabal/bin/pandoc-crossref' \
    --css='styles/web.css' \
    --bibliography='library.bib' \
    --include-in-header='head.html' \
    #--metadata="date:$version" \

# -f markdown: use markdown as input
# -t html: use html as output
# -o: output filename
# -s: create stand alone file
# -S: use smart quotes in output
# -N: number sections
pandoc chapter0.md chapter1.md chapter2.md chapter3.md chapter4.md chapter5.md chapter6.md chapterz.md \
    -f markdown \
    -t html5 \
    -o output/book.html \
    -s \
    -S \
    -N \
    --number-sections \
    --section-divs \
    --chapters \
    -M chapters \
    --filter='/Users/bart/.cabal/bin/pandoc-crossref' \
    --css='styles/web.css' \
    --css='styles/book.css' \
    --bibliography='library.bib' \
    --include-in-header='hyphenation.html' \
    --toc
    #--metadata="date:$version" \

prince output/book.html \
    -o output/book-no-cover.pdf \
    --javascript

# Has quality loss in images!
#gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=output/book.pdf output/images/cover.pdf output/book-no-cover.pdf

# No embedded fonts
#/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py --output output/book.pdf output/images/cover.pdf output/book-no-cover.pdf

pdftk output/book-no-cover.pdf cat 2-end output output/temp.pdf
rm output/book-no-cover.pdf

pdftk output/images/title.pdf output/temp.pdf cat output output/book-no-cover.pdf
rm output/temp.pdf

pdftk output/images/cover.pdf output/book-no-cover.pdf cat output output/book.pdf
