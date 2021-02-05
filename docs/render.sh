#!/bin/bash

## Flags:
## -d to render coursebook using bookdown.
## -s to render slides using rmarkdown::render
## -b do both above options

## Note specific to 738 repo
## need to specify whicj slides i.e., which modules
## to render

dobook=false
doslides=false
doboth=true

while getopts ":bds" opt; do
    case $opt in
	b)
	    dobook=true
	    doslides=true
	    ;;
	d)
	    dobook=true
	    doslides=false
	    ;;
	s)
	    dobook=false
	    doslides=true
	    ;;
	\?)
	    echo "invalid option: -${OPTARG}." >&2
	    ;;
    esac
done
prefix=${!OPTIND}
## Throwing error for no argument provided.
if [ -z "$prefix" ]; then
    echo "ERROR: No file prefix given." >&2
    exit 1
fi
## Checking for presence of a .Rmd file.
if [ -a "$prefix".Rmd ]; then
    rmd_exists=true
else
    rmd_exists=false
    echo "ERROR: .Rmd doesn't exist." >&2
    exit 2
fi
