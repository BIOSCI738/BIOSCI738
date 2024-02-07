#!/bin/bash
echo "Rendering book"
## move to docs dir
cd docs/
if [ -a index.Rmd ]; then
    rmd_exists=true
else
    rmd_exists=false
    echo "ERROR: .Rmd doesn't exist." >&2
    exit 2
fi
## webserve
R -e "bookdown::render_book('index.Rmd',output_dir = './')" 2>&1 >/dev/null
## html book
R -e "bookdown::render_book('index.Rmd',output_dir = './', 'bookdown::html_document2', output_file = 'BIOSCI738.html')" 2>&1 >/dev/null




