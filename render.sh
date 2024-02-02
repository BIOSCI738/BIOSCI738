#!/bin/bash


echo "Rendering book"
if [ -a index.Rmd ]; then
    rmd_exists=true
else
    rmd_exists=false
    echo "ERROR: .Rmd doesn't exist." >&2
    exit 2
fi
## webserve
R -e "bookdown::render_book('index.Rmd',output_dir = 'docs')" 2>&1 >/dev/null
## html book
R -e "bookdown::render_book('index.Rmd',output_dir = 'docs', 'bookdown::html_document2', output_file = 'docs/BIOSCI738.html')" 2>&1 >/dev/null
## remove unneded files in top level
rm -r _main_files/




