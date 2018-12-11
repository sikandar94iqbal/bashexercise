#!/etc/bash



# Process status, information about processes running in memory. If you want a repetitive update of this status, use top.

# -e flag to list all process
# -f full listing ( output format control )

pid=$1
sleep_time=$2


check(){
st=`ps -e |grep -c $1|awk '{print $1}'` 
echo "ps returned $st"
if [[ $st -eq 1 ]]; then
        echo "$1 Process running!"
else
        echo "$1 Process not running!"
fi

}

if [ -z "$pid" ] && [ -z "$sleep_time" ]
then
echo "Some of the arguments are missing"
else 


while [ true ]; 
do
sleep $sleep_time
check $pid
done


fi

: '
while [ true ]; 
do
sleep $sleep_time

if [[ $(ps -ef | grep -c $pid)  -ne 1 ]]; then
        echo "$pid Process running!"
else
        echo "$pid Process not running!"
fi
done

'
