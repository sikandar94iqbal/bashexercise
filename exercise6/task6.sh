#!/etc/bash

#Random Permutations

# either use shuf or random command to generate random nums
# shuf : Write a random permutation of the input lines to standard output.

# -i flag tells about range between 2 numbers
# -n tells about how many random numbers should be generated



echo -e "Enter range (1-50) "
read range

echo -e "Enter count of random numbers"
read count

 
#Internal field seperator

IFS='-' # hyphen (-) is set as delimiter
# -r  Backslash  does not act as an escape character.  The backslash is considered to be part of the line.

# -a The words are assigned to sequential indices of the array variable arr

read -ra arr <<< "$range" # str is read into an array as tokens separated by IFS
IFS=' ' # reset to default value after usage


# tokenized range string and getting starting and ending
# range into individual variables
start="${arr[0]}"
end="${arr[1]}"


random_count=$count

# Function to generate random numbs





generate(){

 

if [[ "$2" == "1" ]]; then

if [[ -f random ]]; then
rm -r random
fi


count=1 
while [ $count -le $1 ]  
do 

echo -e $((RANDOM%$end+$start)) >> random
echo `date +%Y:%m:%d:::%H:%M:%S` >> random

    let count=$count+1
done 

echo "Content copied to file"

elif [[ "$2" == "2" ]]; then

count=1 
while [ $count -le $1 ]  
do 

echo $((RANDOM%$end+$start))
echo `date +%Y:%m:%d:::%H:%M:%S`

   let count=$count+1
done 

else
echo "wrong option"

fi
   


}






echo; echo
echo "Generated random numbers" 

echo -e "Please select option"
echo "1) copy to file"
echo "2) print to stdOut"
read opt


echo 

# Calling function with count argument
generate $random_count $opt



#References 
# String tokenization help taken from
# https://www.tutorialkart.com/bash-shell-scripting/bash-split-string/
