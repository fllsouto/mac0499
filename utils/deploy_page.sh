#!/bin/sh

SOURCE='page/'
OPTIONS='-vR'

if [ -z "$1" ]
	then
		echo "Error! No folder output supplied"
else
	echo "Copying page/ content to $1 \n"
	cp $OPTIONS $SOURCE $1
	echo "\n Done!"
fi