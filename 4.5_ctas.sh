#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log" 2>&1
mkdir -p $LOGDIR/4.5

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1
###### ctas start

psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas01.sql > $LOGDIR"/4.5/ctas01.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas02.sql > $LOGDIR"/4.5/ctas02.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas03.sql > $LOGDIR"/4.5/ctas03.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas04.sql > $LOGDIR"/4.5/ctas04.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas05.sql > $LOGDIR"/4.5/ctas05.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas06.sql > $LOGDIR"/4.5/ctas06.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas07.sql > $LOGDIR"/4.5/ctas07.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas08.sql > $LOGDIR"/4.5/ctas08.log" 2>&1
##psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas09.sql > $LOGDIR"/4.5/ctas09.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas10.sql > $LOGDIR"/4.5/ctas10.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas11.sql > $LOGDIR"/4.5/ctas11.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas12.sql > $LOGDIR"/4.5/ctas12.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas13.sql > $LOGDIR"/4.5/ctas13.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas14.sql > $LOGDIR"/4.5/ctas14.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas15.sql > $LOGDIR"/4.5/ctas15.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas16.sql > $LOGDIR"/4.5/ctas16.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/ctas17.sql > $LOGDIR"/4.5/ctas17.log" 2>&1

wait
###### dml end
END_TM1=`date "+%Y-%m-%d %H:%M:%S"`

SHMS=`echo $START_TM1 | awk '{print $2}'`
EHMS=`echo $END_TM1   | awk '{print $2}'`

SEC1=`date +%s -d ${SHMS}`
SEC2=`date +%s -d ${EHMS}`
DIFFSEC=`expr ${SEC2} - ${SEC1}`

echo "$0: End TIME : "$END_TM1
echo $BMT_NO"|"$START_TM1"|"$END_TM1"|"$DIFFSEC
echo $BMT_NO"|"$START_TM1"|"$END_TM1"|"$DIFFSEC > $LOGFILE
