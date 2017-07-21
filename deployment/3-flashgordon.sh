#!/bin/bash

if [ "$EUID" -ne 0 ]
	  then echo "Please run as root"
		exit
fi

OFDEV="/dev/mapper/mmcblk0"

if [ ! -z $1 ]
	then OFDEV=$1
fi	

echo "Flashing sdcard on $OFDEV"
dd bs=1M if=raspbian.img of=$OFDEV conv=fsync status=progress
sync
echo "done !"
