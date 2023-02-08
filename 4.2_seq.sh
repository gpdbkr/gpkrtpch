#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log" 2>&1
mkdir -p $LOGDIR/4.2

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1
###### query start

psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query01.sql > $LOGDIR"/4.2/query01.log" 2>&1 
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query02.sql > $LOGDIR"/4.2/query02.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query03.sql > $LOGDIR"/4.2/query03.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query04.sql > $LOGDIR"/4.2/query04.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query05.sql > $LOGDIR"/4.2/query05.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query06.sql > $LOGDIR"/4.2/query06.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query07.sql > $LOGDIR"/4.2/query07.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query08.sql > $LOGDIR"/4.2/query08.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query09.sql > $LOGDIR"/4.2/query09.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query10.sql > $LOGDIR"/4.2/query10.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query11.sql > $LOGDIR"/4.2/query11.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query12.sql > $LOGDIR"/4.2/query12.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query13.sql > $LOGDIR"/4.2/query13.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query14.sql > $LOGDIR"/4.2/query14.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query15.sql > $LOGDIR"/4.2/query15.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query16.sql > $LOGDIR"/4.2/query16.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query17.sql > $LOGDIR"/4.2/query17.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query18.sql > $LOGDIR"/4.2/query18.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query19.sql > $LOGDIR"/4.2/query19.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query20.sql > $LOGDIR"/4.2/query20.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query21.sql > $LOGDIR"/4.2/query21.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query22.sql > $LOGDIR"/4.2/query22.log" 2>&1
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query24.sql > $LOGDIR"/4.2/query24.log" 2>&1

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
