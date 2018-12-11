#!/bin/bash
# Listing the planets.

# NOTE : I had to declare array again for each type of loop
# with single declaration output of loops was not correct


echo "For loop"
echo
#declaring and initiliazing array with planet names   
arr=("mercury" "venus" "earth" "mars" "jupiter" "satrun" "uranus" "neptune" "pluto")
len=${#arr[@]}
# print each string in a For loop
for arr in "${arr[@]}"
 do
echo "$arr";
done



#While loop

#find Array length
## ${#ArrayName[@]}

echo; echo
echo "While loop"
echo



#!/bin/bash
arr=("mercury" "venus" "earth" "mars" "jupiter" "satrun" "uranus" "neptune" "pluto")
len=${#arr[@]}
count=0 


while [ $count -le $len ]  
do  
    echo "${arr[$count]}"
    let count=$count+1
done 


echo; echo
echo "Until loop"
echo;



arr=("mercury" "venus" "earth" "mars" "jupiter" "satrun" "uranus" "neptune" "pluto")
len=${#arr[@]}
#count=0 

 COUNTER=0
         until [  $COUNTER -ge $len ]; do
             echo "${arr[$COUNTER]}"
             let COUNTER+=1
         done
