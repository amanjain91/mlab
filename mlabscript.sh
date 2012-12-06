#!/bin/bash

RSYNC=/usr/bin/rsync
SSH=/usr/bin/ssh
KEY=keys/aman.pem
ROUTEMAP=/home/isildur/mlab/mapping.txt

cd

cat $ROUTEMAP | while read line; do
	PAIR=( $line )
	LPATH=${PAIR[0]}
	RPATH=${PAIR[1]}
	$RSYNC -avz -e "$SSH -i $KEY" $LPATH $RPATH
done
