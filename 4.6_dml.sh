#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log" 2>&1
mkdir -p $LOGDIR/4.6

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1
###### dml start

psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml01.sql > $LOGDIR"/4.6/dml01.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml02.sql > $LOGDIR"/4.6/dml02.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml03.sql > $LOGDIR"/4.6/dml03.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml04.sql > $LOGDIR"/4.6/dml04.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml05.sql > $LOGDIR"/4.6/dml05.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml06.sql > $LOGDIR"/4.6/dml06.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml07.sql > $LOGDIR"/4.6/dml07.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml08.sql > $LOGDIR"/4.6/dml08.log" 2>&1
##psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml09.sql > $LOGDIR"/4.6/dml09.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml10.sql > $LOGDIR"/4.6/dml10.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml11.sql > $LOGDIR"/4.6/dml11.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml12.sql > $LOGDIR"/4.6/dml12.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml13.sql > $LOGDIR"/4.6/dml13.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml14.sql > $LOGDIR"/4.6/dml14.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml15.sql > $LOGDIR"/4.6/dml15.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml16.sql > $LOGDIR"/4.6/dml16.log" 2>&1
psql -U udba -d gpkrtpch -ef $BASEDIR/query/dml17.sql > $LOGDIR"/4.6/dml17.log" 2>&1

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
