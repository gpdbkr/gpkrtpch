echo "Checking error for log"
sleep 2
grep ERROR ./log/*.log

echo "Checking error for detail log"
sleep 2
grep ERROR ./log//*/*.log

echo "Checking elapsed time for log"
sleep 5
grep Time ./*.log

echo "Checking elapsed time for detail log"
sleep 5
grep Time ./log/*/*.log

