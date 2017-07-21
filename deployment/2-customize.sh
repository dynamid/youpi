#!/bin/bash

if [ "$EUID" -ne 0 ]
	  then echo "Please run as root"
		    exit
fi

TEMPDIR=`mktemp -d`
echo "TEMPDIR is $TEMPDIR"

LOOPDEVBOOT=`kpartx -lsv raspbian.img | grep p1 | cut -d ' ' -f 1`
LOOPDEV=`kpartx -asv raspbian.img | grep p2 | cut -d ' ' -f 3`
echo "Loop devices are $LOOPDEVBOOT and $LOOPDEV"

mount /dev/mapper/$LOOPDEV $TEMPDIR
mount /dev/mapper/$LOOPDEVBOOT $TEMPDIR/boot
echo "Loop devices mounted in $TEMPDIR"

echo "Customizing the raspbian..."
touch $TEMPDIR/boot/ssh

echo "Cleaning..."

umount $TEMPDIR/boot
umount $TEMPDIR
echo "Loop devices unmounted"

kpartx -d raspbian.img
rmdir $TEMPDIR
echo "All cleaned !"
