#!/bin/bash
INPUT=/scripts/project.csv
OLDIFS=$IFS
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
{
	read
	while read USER Java Angular
	do
		if [ $Angular -eq 1 ]; then
			echo "run deploy Job for User $USER and Project Angular"
			sh /scripts/angular_deploy.sh  $USER
		fi
	done 
} < $INPUT
IFS=$OLDIFS
