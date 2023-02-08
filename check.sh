ls -rt ./log | tail -n 1 | awk '{print "./log/"$1}' | xargs cat
sleep 1

echo "Checking Error"
sleep 1
grep ERROR ./log/$1/*.log
sleep 1

echo "Chcking Time"
sleep 1
grep Time ./log/$1/*.log
