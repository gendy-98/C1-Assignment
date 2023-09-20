#!/bin/bash


if [[ -z $1 || -z $2 ]]; then
	echo "Wrong params!"
	exit 1;
fi

filesdir=$1;
searchstr=$2;


if [ -p $filesdir ]; then
	echo "path is missing $filesdir doesn't exist"
	exit 1
fi

#echo "searching for $searchstr at $filesdir ..."

tree -ifa $filesdir > temp_files

filecount=0
wordcount=0
while IFS= read -r line
do
  #echo "$line"
  if [[ -f $line ]]; then
	wordcount=`expr $wordcount + $(grep -c  $searchstr  $line)`
	filecount=`expr $filecount + 1`
  fi

done < temp_files
echo "The number of files are $filecount and the number of matching lines are $wordcount"
rm -rf temp_files
