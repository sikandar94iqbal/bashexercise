#!/etc/bash




orignal_len=10

new_len=10

generate(){


arr=$1



count=0

while [ $count -lt 5 ]
do
s=$((RANDOM%50+1))
date1=`date +%Y:%m:%d:::%H:%M:%S`

#echo $s
arr+=("$s")
date_arr+=("$date1")
let count=$count+1
done



# 'tr' copies standard input to standard output, performing one of the following operations:
# translate, and optionally squeeze repeated characters in the result,
# squeeze repeated characters,
# delete characters,
# delete characters, then squeeze repeated characters from the result.
a=($(echo "${arr[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))   







}






<< ////


echo "${arr[@]}"
echo; echo
echo "${a[@]}"


orignal_len="${#arr[@]}"
new_len="${#a[@]}"

echo; echo
echo "orignal : $orignal_len"
echo;
echo "new : $new_len"

////

<< ////
generate $arr $orignal_len
echo; echo

orignal_len="${#arr[@]}"
new_len="${#a[@]}"
////




while [[ "$char" != "n" ]]; 
do

generate $arr $orignal_len

orignal_len="${#arr[@]}"
new_len="${#a[@]}"

if [ $orignal_len -ne $new_len ]; then
echo "duplicate found"

echo "${arr[@]}"

echo "${a[@]}"




else
echo "duplicate not found"
echo "${arr[@]}"

echo "${a[@]}"



fi

echo -e "press n to quit if no duplicate found, and press y to save it to file : "
read char

if [[ "$char" == "y" ]]; then


if [[ -f random ]]; then
rm -r random
fi


count=0
length="${#a[@]}"

while [ $count -le $length ]; 
do
echo "${a[$count]}" >> random
echo "${date_arr[$count]}" >> random
let count=$count+1
done

echo "data copied to file"

exit 0

fi

arr=()
a=()
date_arr=()
done

echo; echo









