#!/etc/bash


#Script to practice text processing
#Modifying spacing in text file


#Get text file from cli passed as an arguement
file_path=$1
orignal_name=$file_path
global_str=""

#check if user has entered filename as arguement or not
if [ -z $file_path ]; then
echo "file path not passed as arguement"
else

#Check if file exists
if [ ! -f $file_path ]; then
    echo "File not found!"
else

#check if user mentioned file is txt file
if [ ${file_path: -4} == ".txt" ]; then

#Declare array
args=()
#Read line by line from file
while read -r line; do
    STR="$line"
    #Populate array with file's content
    args+=("$line")

done < "$file_path"

#get array length
len=${#args[@]}
count=0 

#check if target file already exist
if [ ! -f target.txt ]; then
    echo ""
else

#delete orignal and target file if exist
rm -r $file_path
rm -r target.txt

fi

#write data from array to target file
while [ $count -le $len ]  
do  
    data="${args[$count]}"
#echo to stdout and give 2 line spaces
echo $data
echo; echo
#write to targetfile with 2 lines space
echo -e "$data\n\n" >> target.txt
    let count=$count+1
done 

#Rename target file to orignal
mv target.txt $file_path

#Get user approval and revert file back to its orignal state
read -p "File modified press ENTER to make it normal" var
if [ ${#var} -eq 0 ]; then

#create a mock file to use it later on
awk 'NF' $orignal_name >> test1.txt  

if [ ! -f $orignal_name ]; then
  echo "file not found"
else
rm -r $orignal_name

fi

#finally write mock file's content to orignal file
awk 'NF' test1.txt >> $orignal_name

#and finally remove mock file
if [ ! -f test1.txt ]; then
  echo "file not found"
else
rm -r test1.txt

fi


fi


else
	echo "$file_path is not text file"
fi


fi



fi




