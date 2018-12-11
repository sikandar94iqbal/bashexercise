#!/etc/bash

echo;
echo 
echo "Unique System ID"
echo ""


#Generate id 
#md5sum is a computer program that calculates and verifies 128-bit MD5 hashes
#md5sum is used to verify the integrity of files, as virtually any change to a file will cause its MD5 hash to change. Most commonly, md5sum is used to verify that a file has not changed as a result of a faulty file transfer, a disk error or non-malicious meddling. 
ID=`md5sum /etc/passwd`

#cut command is used to manipulate strings
# -c flag for character processing
# we need 1st 6 digits so we are giving range 1-6

echo -e "Your system ID : "
echo "$ID" | cut -c 1-6

echo;
echo 
