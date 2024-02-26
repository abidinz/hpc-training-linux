#!/bin/bash
date
jam=`date +%H`
if [ $jam -lt 10 ]; then
	echo "Selamat Pagi"
else
	if [ $jam -lt 15 ]; then
		echo "Selamat Siang"
	else
		if [ $jam -lt 17 ]; then
			echo "Selamat Sore"
		else
			echo "Selamat Lembur"
		fi
	fi
fi
