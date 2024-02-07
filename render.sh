#!/bin/bash


echo "Rendering book"
if [ -a index.Rmd ]; then
    rmd_exists=true
else
    rmd_exists=false
    echo "ERROR: .Rmd doesn't exist." >&2
    exit 2
fi
## clean docs folder
rm -rf docs/
## webserve
R -e "bookdown::render_book('index.Rmd',output_dir = 'docs')" 2>&1 >/dev/null
## html book
R -e "bookdown::render_book('index.Rmd',output_dir = 'docs', 'bookdown::html_document2', output_file = 'docs/BIOSCI738.html')" 2>&1 >/dev/null
## move required files
rm -rf _bookdown_files/




