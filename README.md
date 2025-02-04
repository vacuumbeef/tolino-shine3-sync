# tolino-shine3-sync

Shell script for syncing a books directory with Tolino Shine 3 e-Reader.

__Device needs to be rooted and has wireless adb enabled__

### Dependencies
- adb
- adb-sync - https://github.com/google/adb-sync
- fbconverter - https://github.com/tomneko/fbconverter

## Some instructions:
Place your books into `Books` directory and run `sync.sh`

The script will check the files in the `Books` directory, if it finds files with fb2 extension - it will convert it to epub and move the original files to `.original_files` folder. Then it will connect to the book through wireless adb, sync the `Books` directory and execute `UsbStorageActivity` on the device twice, to force it to update it's library
