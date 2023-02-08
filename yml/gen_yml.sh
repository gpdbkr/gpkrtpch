DB=gpkrtpch
usr=udba
ghost=mdw
gport=5432
ehost=mdw
spath=/data/gpkrtpch/data
gschema=gpkrtpch
gschema_err=gpkrtpch_err
sdel='|'

#cat 1 > gen_serial.txt
psql -h $ghost -p $gport -d $DB -U $usr -At -c "select lower(tablename) from pg_tables where schemaname= '$gschema' and tablename not like '%_prt_%';"  > schemalist.txt
for i in `cat schemalist.txt`
do

echo "VERSION: 1.0.0.1" > $i.yml
echo "DATABASE:" $DB>> $i.yml
echo "USER:"  $usr>> $i.yml
echo "HOST:"  $ghost>> $i.yml
echo "PORT:" $gport>> $i.yml
echo "GPLOAD:" >> $i.yml
echo "    INPUT:" >> $i.yml
echo "     - SOURCE:" >> $i.yml
echo "          LOCAL_HOSTNAME:" >> $i.yml
echo "            -" $ehost   >> $i.yml
echo "          PORT_RANGE: [8081, 9081]"  >> $i.yml
echo "          FILE: [" $spath/$i.tbl "]"  >> $i.yml
echo "     - COLUMNS:"   >> $i.yml
psql -h $ghost -p $gport -d $DB -U $usr -At -c "\d $gschema.$i" | awk -F"|" '{print "- "$1": " $2}' | sed 's/^/       /'  >> $i.yml
echo "     - FORMAT: text"  >> $i.yml
echo "     - DELIMITER: '$sdel'">> $i.yml
echo "     - NULL_AS: '' ">> $i.yml
echo "     - ERROR_LIMIT: 25" >> $i.yml
echo "     - ERROR_TABLE: "$gschema_err"."$i"_err">> $i.yml
echo "    OUTPUT:" >> $i.yml
echo "     - TABLE: "$gschema.$i >> $i.yml
echo "     - MODE: INSERT ">> $i.yml
echo "     - MAPPING: ">> $i.yml
psql -h $ghost -p $gport -d $DB -U $usr -At -c "\d $gschema.$i" | awk -F"|" '{print $1": "$1}' | sed 's/^/        /'  >> $i.yml
done

