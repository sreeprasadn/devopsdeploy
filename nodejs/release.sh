#!/bin/bash
INPUT=project.csv
OLDIFS=$IFS
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
{
	read
	while read USER Java Angular
	do
		echo "Name: $USER"
		echo "Java: $Java"
		echo "Angular : $Angular"
	done 
} < $INPUT
IFS=$OLDIFS
