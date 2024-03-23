#!/bin/sh

# allow default hard-wired dir
rootdir=$HOME/work/camx_lpa/trunk

if [ "$#" -eq 0 ]
then
	echo "usage: $0 [ -p _rootdir_ ] keyword"
	exit 1
fi

if [ $1 == -p ]
then
	shift
	if [  -d $1 ] 
	then 
		rootdir=$1 
		shift
	elif [ x$rootdir == x ]
	then
		echo "usage: $0 [ -p _rootdir_ ] keyword"
		exit 1
	fi
fi

grep "\W$1\W" $rootdir/Includes/camx.prm $rootdir/Includes/*.inc $rootdir/Mod_src/*.f | sed "s=$rootdir/=="
