#!/bin/bash

## Flags:
## -b to render coursebook using bookdown.
## -s to render slides using rmarkdown::render
## Note specific to 738 repo
## need to specify which slides i.e., which modules
## to render

dobook=false
doslides=false

while getopts ":bs" opt; do
    case $opt in
	b)
	    dobook=true
	    ;;
	s)
	    doslides=true
	    ;;
	\?)
	    echo "invalid option: -${OPTARG}." >&2
	    ;;
    esac
done
folder=${!OPTIND}
## Throwing error for no argument (folder) provided.
if [ -z "$folder" ]; then
    echo "ERROR: No folder given." >&2
    exit 1
fi
## book
if [ "$dobook" = true ]; then
    echo "Rendering book"
    cd "$folder"
    if [ -a index.Rmd ]; then
	rmd_exists=true
    else
	rmd_exists=false
	echo "ERROR: .Rmd doesn't exist." >&2
	exit 2
    fi
    R -e "bookdown::render_book('index.Rmd',output_dir = './')" 2>&1 >/dev/null
else
    if [ "$doslides" = true ]; then
	## slides
	echo "Rendering slides"
	cd "$folder"
	if [ -s index.Rmd ]; then
	    rmd_exists=true
	else
	    rmd_exists=false
	    echo "ERROR: .Rmd doesn't exist." >&2
	    exit 2
	fi
	R -e "rmarkdown::render('index.Rmd',output_dir = './')" 2>&1 >/dev/null
    fi
fi



