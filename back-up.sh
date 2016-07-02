#!/bin/bash 


SOURCE=/media/backup/BackUp/
DESTINATION=/media/extbackup/BackUp 
#Check if the source directory exists 

if [ ! -e $SOURCE ]; then
	mkdir -p $SOURCE
elif [ -d $SOURCE  ]; then
	echo 'Source folder exists. Moving on'
fi

#Check if the destination directory exists

if [ ! -e $DESTINATION ]; then
	mkdir -p $DESTINATION
elif [ -d $DESTINATION ]; then 
	echo 'Destination drive is mounted and the destination folder already exists. Moving on.' 
fi



#Check the difference between two foldrs if they are the same do nothing if they are 
#different copy the different files on source to destination.

rsync -recursive --ignore-existing -v -progress $SOURCE $DESTINATION > backup.log

#tail -f /home/eren/backup.log

if [ $? -eq 0 ]; then
	echo 'Backup is successful.'
elif [ $? -eq 1 ]; then
	echo 'An error occured.Backup is not successful.'
fi


