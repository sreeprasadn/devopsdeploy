#!/bin/bash
INPUT=/scripts/project.csv
OLDIFS=$IFS
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
{
	read
	while read USER Java Angular
	do
		if [ $Java -eq 1 ]; then
			echo "run deploy Job for User $USER and Project Java"
			sh /scripts/java_deploy.sh  $USER
		fi
	done 
} < $INPUT
IFS=$OLDIFS
