#!/etc/bash


# Either use factor command to print prime numbers or use loops

primes=`factor {60000..63000} | awk 'NF==2{print $1}'`

echo "Printing primes by factor command"

printf "%s\n\n" "$primes"



echo; echo
echo "Print by loop"
echo; echo
prime_1=0



echo -e "Enter range (1-50) "
read range

#IFS stands for "internal field separator". It is used by the shell to determine how to do word splitting, i. e. how to recognize word boundaries.

IFS='-' # hyphen (-) is set as delimiter
read -ra arr <<< "$range" # str is read into an array as tokens separated by IFS
IFS=' ' # reset to default value after usage

# tokenized range string and getting starting and ending
# range into individual variables
start="${arr[0]}"
end="${arr[1]}"



echo "Prime number between $start to $end is:"
 

for((i=$start;i<=$end;))
do
for((j=i-1;j>=2;))
do
if [  `expr $i % $j` -ne 0 ] ; then
prime_1=1
else
prime_1=0
break
fi
j=`expr $j - 1`
done
if [ $prime_1 -eq 1 ] ; then
echo "$i is prime"
else 
echo "$i not prime"
fi
i=`expr $i + 1`
done



