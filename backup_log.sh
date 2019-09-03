#!/bin/sh

for i in $@; do
	if [ $i = '-d' -o $i = '--debug' ]; then
		set -x
	fi
done

YESTERDAY=$(date -d yesterday +%F)

# Command Line Parameters
BACKUP_LOG_FOLDER=$1

#TODO: Need to check how to implement options for arguments. Need to check if getopts can be used here in this case.

echo "Archiving log directory $BACKUP_LOG_FOLDER for date $YESTERDAY"

if [ ! -d $1 ]; then
	# Directory does not exist. Exit.
	echo "Log directory $1 does not exist. Skipping...!!"
	exit 1
fi

cd $BACKUP_LOG_FOLDER

# Create the archive folder if not exists
mkdir -p archive

# Check if the taz command exists or not. If not display error and exit
if [ ! -x "$(command -v tar)" ]; then
	echo 'Error: tar is not installed.' >&2
	
	#TODO: Need to check if the return code is necessary
	exit 1
fi

if [ $(find ./ -name '*.log*' | wc -l) -gt 0 ]; then
	tar -czvf archive/${YESTERDAY}.tar.gz *.log*

	rm *.log*
fi

# Determine till how long the archives should be made available. May be this config also can be taken as an argument


echo "Successfully archived log directory $BACKUP_LOG_FOLDER for date $YESTERDAY"
