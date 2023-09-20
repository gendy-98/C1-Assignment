#!/bin/bash

if [[ -z $1 || -z $2 ]]; then
        echo "Wrong params!"
        exit 1;
fi


writefile=$1;
writestr=$2;

install -D /dev/null $writefile

touch $writefile
echo "$writestr" > $writefile

if [[ -f $writefile ]]; then
	echo "$writestr" > $writefile
else
	echo "file is not created"
	exit 1
fi


