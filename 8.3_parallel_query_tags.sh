#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"
mkdir -p $LOGDIR/8.3

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1

###### query start
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query01.sql > $LOGDIR"/8.3/query01.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query02.sql > $LOGDIR"/8.3/query02.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query03.sql > $LOGDIR"/8.3/query03.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query04.sql > $LOGDIR"/8.3/query04.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query05.sql > $LOGDIR"/8.3/query05.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query06.sql > $LOGDIR"/8.3/query06.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query07.sql > $LOGDIR"/8.3/query07.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query08.sql > $LOGDIR"/8.3/query08.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query10.sql > $LOGDIR"/8.3/query10.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query11.sql > $LOGDIR"/8.3/query11.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query12.sql > $LOGDIR"/8.3/query12.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query13.sql > $LOGDIR"/8.3/query13.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query14.sql > $LOGDIR"/8.3/query14.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query15.sql > $LOGDIR"/8.3/query15.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query16.sql > $LOGDIR"/8.3/query16.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/sql/query17.sql > $LOGDIR"/8.3/query17.log" 2>&1 &

wait
###### query end
END_TM1=`date "+%Y-%m-%d %H:%M:%S"`

SHMS=`echo $START_TM1 | awk '{print $2}'`
EHMS=`echo $END_TM1   | awk '{print $2}'`

SEC1=`date +%s -d ${SHMS}`
SEC2=`date +%s -d ${EHMS}`
DIFFSEC=`expr ${SEC2} - ${SEC1}`

echo "$0: End TIME : "$END_TM1
echo $BMT_NO"|"$START_TM1"|"$END_TM1"|"$DIFFSEC
echo $BMT_NO"|"$START_TM1"|"$END_TM1"|"$DIFFSEC > $LOGFILE
