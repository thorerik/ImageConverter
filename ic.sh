#!/bin/bash

# mogrify -format jpg $1
# mv `basename $1 CR2`jpg img/
# exiftool -b -ThumbnailImage $1 > img/thumb/`basename $1 CR2`jpg 
source functions.sh

# default we don't recurse
recursive=0

# Script dependencies
DEPENDENCIES="mogrify exiftool"

usage="$(basename "$0") [-h] [-r] <folder to convert from> [destination folder]

where:
    -h  show this help text
    -r  recursively process files"


while getopts ':hr' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    r) recursive=1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done
shift $((OPTIND - 1))


# Check dependencies
deps



exit 0