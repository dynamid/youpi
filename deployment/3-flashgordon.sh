#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    echo "Dear mac user,"
    echo ""
    echo "you're fucky crazy to run this script on your mac ..."
    echo "I propose you to firstly get the SD card disk number : "
    echo "     diskutil list"
    echo ""
    echo "and next made dd by your own (with raw disk to speedup):"
    echo "     sudo dd bs=1m if=raspbian.img of=/dev/rdisk<disk# from diskutil> conv=sync"
    echo ""
    echo "May the force be with you!"
    echo "  (Hope to see you again)"
    exit;
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    echo "Win 32 ... you're fired!"
    exit;
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    echo "Win 64 ... you're fired!"
    exit;
fi



if [ "$EUID" -ne 0 ]
	  then echo "Please run as root"
		exit
fi

OFDEV="/dev/mmcblk0"

if [ ! -z $1 ]
	then OFDEV=$1
fi

echo "Flashing sdcard on $OFDEV"
dd if=raspbian.img of=$OFDEV status=progress
sync
echo "done !"
