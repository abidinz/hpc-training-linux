#!/bin/bash

#Menentukan waktu untuk data satelit dengan satuan 0 
waktu_sekarang=$(date -u +%Y%m%d%H%M)
waktu_satelit=${waktu_sekarang:0:11}0

#Membuat variabel direktori penyimpanan berdasarkan Tahun, Bulan dan Tanggal
DIR_SIMPAN=~/CITRA_SATELIT/${waktu_satelit:0:4}/${waktu_satelit:4:2}/${waktu_satelit:6:2}
#Membuat direktori penyimpanan citra satelit menggunakan variabel direktori yang sudah dibuat
mkdir -p ${DIR_SIMPAN} 

#Dikarenakan ketersediaan data citra satelit membutuhkan waktu proses 5 menit lebih maka kita perlu menambahkan pengecekan menit agar citra satelit yang kita unduh merupakan citra satelit terbaru.
echo ${waktu_sekarang:11:1}
menit=${waktu_sekarang:11:1}
until [ $menit -ge 6 ]
do
	echo "Satuan menit saat ini adalah: " $menit
	if (( menit >= 6)) ;then
		echo "Satuan menit sudah lebih dari menit ke 5"
		echo 'Lanjut proses unduh citra satelit'
		break
	fi
	((menit++))
	echo "Menunggu untuk menit ke :" $menit
	sleep 45s
done

#Membuat alamat URL untuk mendapatkan citra satelit terbaru
URL_SATELIT="https://satelit.bmkg.go.id/IMAGE/HIMA/H08_EH_Indonesia_${waktu_satelit:8:4}.png"
#Mengunduh citra satelit menggunakan program wget dan menyimpan hasil pengunduhan pada direktori yang sudah dibuat
wget ${URL_SATELIT} -O ${DIR_SIMPAN}/Satelit_EH_Indonesia_${waktu_satelit:0:8}_${waktu_satelit:8:4}.png

echo ''
echo "-----------------------------------------------"
echo 'SELESAI'
exit 1