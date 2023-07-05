#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1
###### query start

echo "" > $LOGDIR"/analyze.log"
psql -U udba -d gpkrtpch -ec "analyze gpkrtpch.customer ;" >> $LOGDIR"/analyze.log" &
psql -U udba -d gpkrtpch -ec "analyze gpkrtpch.lineitem ;" >> $LOGDIR"/analyze.log" &
psql -U udba -d gpkrtpch -ec "analyze gpkrtpch.orders   ;" >> $LOGDIR"/analyze.log" &
psql -U udba -d gpkrtpch -ec "analyze gpkrtpch.part     ;" >> $LOGDIR"/analyze.log" &
psql -U udba -d gpkrtpch -ec "analyze gpkrtpch.partsupp ;" >> $LOGDIR"/analyze.log" &
psql -U udba -d gpkrtpch -ec "analyze gpkrtpch.region   ;" >> $LOGDIR"/analyze.log" &
psql -U udba -d gpkrtpch -ec "analyze gpkrtpch.supplier ;" >> $LOGDIR"/analyze.log" &
psql -U udba -d gpkrtpch -ec "analyze gpkrtpch.nation   ;" >> $LOGDIR"/analyze.log" &

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
