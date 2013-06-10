#!/bin/bash

# mogrify -format jpg $1
# mv `basename $1 CR2`jpg img/
# exiftool -b -ThumbnailImage $1 > img/thumb/`basename $1 CR2`jpg 
source functions.sh

# default we don't recurse
recursive=0

# default we don't make thumbnails
thumb=0

# Script dependencies
DEPENDENCIES="mogrify exiftool"

usage="$(basename "$0") [-h] [-rt] <folder to convert from> [destination folder]

where:
    -h  show this help text
    -r  recursively process files
	-t	create thumbnails from raw files in thumb/"


while getopts ':hrt' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    r) recursive=1
       ;;
	t) thumb=1
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

# Make sure folder exists, if not, exit.
if [[ ! -d $1 ]]
	then
	echo "$1 does not exist" >&2
	echo "$usage" >&2
	exit 1
fi

# If second folder is specified, check that it exists, if not, ask if user wants to create it, if not, exit.
if [[ -n $2 ]]
	then
	if [[ ! -d $2 ]]
		then
		read -p "$2 does not exist, do you want to create it? " -n 1 -r
		echo "\n"
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
		    echo "mkdir -p $2"
		else
			exit 1
		fi
	fi
fi


exit 0