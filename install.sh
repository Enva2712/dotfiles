#!/bin/bash

##### Important directories and usage text #####
DIR=$(dirname "$0")
LINK_DIR="$DIR/link"
OTHER_DIR="$LINK_DIR/other"
USAGE="Usage: install.sh [OPTION]\nOPTIONS\n\t-r, --remove\n\t\tRemove existing dotfiles before symlinking\n\t-b, --backup\n\t\tSuffix existing dotfiles with '.backup' before symlinking\n\t-p, --prompt\n\t\tPrompt whether or not to remove existing dotfile on a per-file basis"


err () {
	printf "\r\033[0;31mError: \033[0m$1\n";
}


##### Check if user supplied arguments and exit if none present #####
if [ $# -eq 0 ]; then
	err "No option specified"
	echo -e $USAGE
	exit
fi

##### Parse command line arguments #####
case $1 in
	-r|--replace)
		printf "Dotfiles that are already present will be overwritten. Are you sure you want to continue? (y/N): "
		read input
		echo
		if [ "$input" == "y" ] || [ "$input" == "Y" ]; then
			replace="true"
		else
			echo "'Y' was not entered; exiting"
			exit
		fi
	;;
	-b|--backup)
		echo "Dotfiles that are already present will be suffixed with '.backup'."
		backup="true"
	;;
	-p|--prompt)
		echo "You will be prompted what to do if a dotfile already exists."
	;;
	-h|--help)
		echo -e $USAGE
		exit
	;;
	*)
		err "Improper option specified"
		echo -e $USAGE
		exit
	;;
esac


##### Find out where to install a specific dotfile based on filename #####
function get_dest {
	local loc=$1
	local ext="${loc##*.}" name="$(basename ${loc%.*})"
	if [ "$ext" == "link" ]; then
 		echo "$HOME/.$(basename "${loc%.*}")"
	elif [ "$ext" == "other" ]; then
		echo "$($OTHER_DIR/$name)"
	fi
	return
}

##### Create symbolic link for a file #####
function set_link {
	local loc=$1
	if [ $# -eq 1 ]; then
		local dest=$(get_dest $loc)
	elif [ $# -eq 2 ]; then
		local dest=$2
	fi

	echo "Linking $loc to $dest"

	if [ -f $dest ]; then
		if [ "$replace" == "true" ]; then
			ln -f $loc $dest
		elif [ "$backup" == "true" ]; then
			ln -S '.backup' $loc $dest
		else
			ln -i $loc $dest
		fi
	else
		ln $loc $dest
	fi

	return
}


##### Itterate over all files under link dir and attempt to set up symbolic links #####
function link_all {
	echo "Creating symbolic links for dotfiles within HOME directory..."
	for loc in $(find "$LINK_DIR" -name "*.link"); do
		set_link "$loc"
	done
	echo "Creating symbolic links for dotfiles residing outside of HOME directory..."
	for loc in $(find "$LINK_DIR" -name "*.other"); do
		set_link "$loc"
	done
}


link_all
