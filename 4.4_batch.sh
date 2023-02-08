#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"
mkdir -p $LOGDIR/4.4

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1

###### query start
psql -U udba -d gpkrtpch -ef $BASEDIR/query/batch01.sql > $LOGDIR"/4.4/batch01.log" 2>&1 &
psql -U udba -d gpkrtpch -ef $BASEDIR/query/batch02.sql > $LOGDIR"/4.4/batch02.log" 2>&1 &
psql -U udba -d gpkrtpch -ef $BASEDIR/query/batch03.sql > $LOGDIR"/4.4/batch03.log" 2>&1 &
psql -U udba -d gpkrtpch -ef $BASEDIR/query/batch04.sql > $LOGDIR"/4.4/batch04.log" 2>&1 &
psql -U udba -d gpkrtpch -ef $BASEDIR/query/batch05.sql > $LOGDIR"/4.4/batch05.log" 2>&1 &

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
