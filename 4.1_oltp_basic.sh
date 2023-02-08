#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"
mkdir -p $LOGDIR/4.1

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1
###### query start

psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/a01.sql > $LOGDIR"/4.1/a01.log" &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/a02.sql > $LOGDIR"/4.1/a02.log" &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/a03.sql > $LOGDIR"/4.1/a03.log" &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/a04.sql > $LOGDIR"/4.1/a04.log" &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/a05.sql > $LOGDIR"/4.1/a05.log" &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/a06.sql > $LOGDIR"/4.1/a06.log" &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/a07.sql > $LOGDIR"/4.1/a07.log" &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/a08.sql > $LOGDIR"/4.1/a08.log" &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/a09.sql > $LOGDIR"/4.1/a09.log" &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/a10.sql > $LOGDIR"/4.1/a10.log" &

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
