#!/etc/bash



# Ask user for file names in a loop
# runs while user does not enter 'n'
arr=()
echo "Note : press 'n' to quit "
while [[ "$char" != "n" ]]; 
do
echo -e "Enter file name : "
read char
arr+=("$char")
done

echo; echo


: '
for i in "${arr[@]}";
do
if [[ "$i" != "n" ]]; then
#file -i -b "$i"
echo "$i"
fi
done
'


# Iterate through who array having file names
for file in "${arr[@]}" ; do

# Array will have 'n' in it so putting condition to disclude that

if [[ "$file" != "n" ]]; then
   

case $file in

# giving pattern in case conditions of file's extensions 
 *.tar.gz)   
  tar xzf $file
  echo "tar.gz file has been unzipped"    
  ;;
 *.bz2)
  bunzip2 $file
  echo "bunzip2 file has been unzipped"  
  ;;
 *.gz)     
  gunzip $file 
  echo "gunzip file has been unzipped"  
  ;;
 *.tar)   
  tar xf $file
  echo "tar file has been unzipped"  
  ;;
 *.zip)
   unzip $file
   echo "zip file has been unzipped"  
  ;;
 *.Z) 
  uncompress $file
  echo "Z file has been unzipped"   
  ;;
 *)
 echo "$file was not desired type" 
  ;;

esac

fi

done








