#!/etc/bash

#This file will clone itself to backup.sh

#cp command -r (copy -r recursively)


#get name of current script
# basename Strip directory and suffix from filenames
# basename will print NAME with any leading directory components removed. If specified, it will also remove a trailing SUFFIX (typically a file extention).
scriptname="$(basename $0)"


#get current scipt's file path
current_file_path=`pwd`

#concatinating file path with it's name
full_path="$current_file_path/$scriptname"

#create directory for backup file 
# -p flag will create nested directories, but only if they don't exist already
mkdir -p "$current_file_path/BackupFolder"

#concat new backupfolder path to current dir
backupfolder_path="$current_file_path/BackupFolder"

#copying file to backup folder 
cp -r $full_path $backupfolder_path/backup.sh


echo "Copying done" 









