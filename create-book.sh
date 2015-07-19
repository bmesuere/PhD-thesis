#! /bin/bash

# -f markdown: use markdown as input
# -t html: use html as output
# -s: create stand alone file
# -o: output filename
pandoc test.md -f markdown -t html -s -o test.html
