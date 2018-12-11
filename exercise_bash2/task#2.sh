#!/etc/bash

#This script will ls home directory and write
#its content to file, zip it and copy it to usb 


#Get script path to use it afterwards
script_path=`pwd`

status=""

#Go to home dir
cd $HOME

#get home dir's content
data=`ls`


#check if target file already exist
if [ ! -f data ]; then
    echo ""
else
rm -r data
fi

#write it to file
echo $data >> data

#get name of current script
scriptname="$(basename $0)"

#get current scipt's file path
current_file_path=`pwd`

#concatinating file path with it's name
full_path="$script_path/$scriptname"

data_file_path=$HOME/data


#Zip the file
#flags : -c to create . -v verbose get extented file information .
# -z write permissions . -f file . and give filepath to be zipped
tar -cvzf backup.tgz --absolute-names $data_file_path

#Wait for user to press enter
# -p (prompt) Display prompt on standard error, without a trailing newline, before attempting to read
# any input. The prompt is displayed only if input is coming from a terminal.
read -p "Please insert USB and press ENTER" var

#check if user has pressed enter
if [ ${#var} -eq 0 ]; then

#get path of newly created zip file
zip_path=$HOME/backup.tgz

#get usb path
usb1=`sudo fdisk -l|grep /dev/sdb|awk '{print $1}'`

#get user name
user_name=$(whoami)

##Remove Disk from "Disk /dev/sdb1"
#remove suffix disk
usbPath=${usb1#"Disk"}


#Check if usb is mounted 
#find usb path in /dev/null file

#mount a file system
# All files accessible in a Unix system are arranged in one big tree, the file hierarchy, rooted at /. # These files can be spread out over several devices. The mount command serves to attach the file system  # found on some device to the big file tree.

if mount | grep "on ${usbPath} type" > /dev/null
then

#get current dir
dir=$dir`pwd`/textFile

#Code to get USB folder name
# AWK pattern scanning and processing language

USBNAME=`df -h|grep /dev/sdb|awk '{print $6}'`
#Tokenizing string where '/' is found
# IFS (internal field separator)
IFS='/' read -r -a array <<< "$USBNAME"
#getting foldername from array
usb_name="${array[3]}"

## Recursively copy zipped file to usb
sudo cp -r $zip_path /media/$user_name/$usb_name
status="Zip file copied to usb"
else
sudo mount $usbPath /media/$user_name
status="Usb was not mounted"
fi

echo $status


fi





