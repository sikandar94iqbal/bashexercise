#!/etc/bash


#this script prints file backwards which is given as argument

#get file name from argument
file_name=$1

#Read file's content into a variable
value=`cat $file_name`
#echo "$value"

arr=()

#read string line by line and populate array
while read -r line; do
   arr+=("$line")
done <<< "$value"


#Find array length
len=${#arr[@]}

#Reverse print array's content
count=$len
while [ $count -ge 0 ]  
do  
    echo "${arr[$count]}"
    let count=$count-1
done 


