#!/bin/bash
# Made for tolino shine 3
#
# Dependencies:
# adb
# adb-sync - https://github.com/google/adb-sync
# fbconverter - https://github.com/tomneko/fbconverter

books_dir=./Books
orig_files_dir=./.original_files
device_ip=192.168.1.142

mkdir -p $books_dir $orig_files_dir

convert_and_move() {
	fb2c convert --to epub "$file" $books_dir && mv "$file" ./.original_files
}

sync() {
	adb-sync -d $books_dir/ /sdcard/Books
}

force_update_library() {
	adb shell "su -c 'am start -n de.telekom.epub/.ui.activities.UsbStorageActivity'"
	sleep 5
	adb shell "su -c 'am start -n de.telekom.epub/.ui.activities.UsbStorageActivity'"
}


for file in "$books_dir"/*
do
	ext="${file##*.}"

	case $ext in
		fb2)
			echo "$file"
			convert_and_move
			;;
		*)
			;;
	esac
done

adb connect $device_ip
sync
force_update_library
adb disconnect $device_ip
