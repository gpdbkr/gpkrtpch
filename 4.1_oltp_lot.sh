#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"
mkdir -p $LOGDIR/4.1

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1
###### query start

echo "" > $LOGDIR"/4.1/oltp01.log" 
echo "" > $LOGDIR"/4.1/oltp02.log" 
echo "" > $LOGDIR"/4.1/oltp03.log" 
echo "" > $LOGDIR"/4.1/oltp04.log" 
echo "" > $LOGDIR"/4.1/oltp05.log" 
echo "" > $LOGDIR"/4.1/oltp06.log" 
echo "" > $LOGDIR"/4.1/oltp07.log" 
echo "" > $LOGDIR"/4.1/oltp08.log" 
echo "" > $LOGDIR"/4.1/oltp09.log" 
echo "" > $LOGDIR"/4.1/oltp10.log" 
echo "" > $LOGDIR"/4.1/oltp11.log" 
echo "" > $LOGDIR"/4.1/oltp12.log" 
echo "" > $LOGDIR"/4.1/oltp13.log" 
echo "" > $LOGDIR"/4.1/oltp14.log" 
echo "" > $LOGDIR"/4.1/oltp15.log" 
echo "" > $LOGDIR"/4.1/oltp16.log" 
echo "" > $LOGDIR"/4.1/oltp17.log" 

psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp01.sql >> $LOGDIR"/4.1/oltp01.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp02.sql >> $LOGDIR"/4.1/oltp02.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp03.sql >> $LOGDIR"/4.1/oltp03.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp04.sql >> $LOGDIR"/4.1/oltp04.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp05.sql >> $LOGDIR"/4.1/oltp05.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp06.sql >> $LOGDIR"/4.1/oltp06.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp07.sql >> $LOGDIR"/4.1/oltp07.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp08.sql >> $LOGDIR"/4.1/oltp08.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp09.sql >> $LOGDIR"/4.1/oltp09.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp10.sql >> $LOGDIR"/4.1/oltp10.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp11.sql >> $LOGDIR"/4.1/oltp11.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp12.sql >> $LOGDIR"/4.1/oltp12.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp13.sql >> $LOGDIR"/4.1/oltp13.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp14.sql >> $LOGDIR"/4.1/oltp14.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp15.sql >> $LOGDIR"/4.1/oltp15.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp16.sql >> $LOGDIR"/4.1/oltp16.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp17.sql >> $LOGDIR"/4.1/oltp17.log"  2>&1 &

psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp01.sql >> $LOGDIR"/4.1/oltp01.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp02.sql >> $LOGDIR"/4.1/oltp02.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp03.sql >> $LOGDIR"/4.1/oltp03.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp04.sql >> $LOGDIR"/4.1/oltp04.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp05.sql >> $LOGDIR"/4.1/oltp05.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp06.sql >> $LOGDIR"/4.1/oltp06.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp07.sql >> $LOGDIR"/4.1/oltp07.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp08.sql >> $LOGDIR"/4.1/oltp08.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp09.sql >> $LOGDIR"/4.1/oltp09.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp10.sql >> $LOGDIR"/4.1/oltp10.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp11.sql >> $LOGDIR"/4.1/oltp11.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp12.sql >> $LOGDIR"/4.1/oltp12.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp13.sql >> $LOGDIR"/4.1/oltp13.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp14.sql >> $LOGDIR"/4.1/oltp14.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp15.sql >> $LOGDIR"/4.1/oltp15.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp16.sql >> $LOGDIR"/4.1/oltp16.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp17.sql >> $LOGDIR"/4.1/oltp17.log"  2>&1 &

psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp01.sql >> $LOGDIR"/4.1/oltp01.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp02.sql >> $LOGDIR"/4.1/oltp02.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp03.sql >> $LOGDIR"/4.1/oltp03.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp04.sql >> $LOGDIR"/4.1/oltp04.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp05.sql >> $LOGDIR"/4.1/oltp05.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp06.sql >> $LOGDIR"/4.1/oltp06.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp07.sql >> $LOGDIR"/4.1/oltp07.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp08.sql >> $LOGDIR"/4.1/oltp08.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp09.sql >> $LOGDIR"/4.1/oltp09.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp10.sql >> $LOGDIR"/4.1/oltp10.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp11.sql >> $LOGDIR"/4.1/oltp11.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp12.sql >> $LOGDIR"/4.1/oltp12.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp13.sql >> $LOGDIR"/4.1/oltp13.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp14.sql >> $LOGDIR"/4.1/oltp14.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp15.sql >> $LOGDIR"/4.1/oltp15.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp16.sql >> $LOGDIR"/4.1/oltp16.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp17.sql >> $LOGDIR"/4.1/oltp17.log"  2>&1 &

psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp01.sql >> $LOGDIR"/4.1/oltp01.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp02.sql >> $LOGDIR"/4.1/oltp02.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp03.sql >> $LOGDIR"/4.1/oltp03.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp04.sql >> $LOGDIR"/4.1/oltp04.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp05.sql >> $LOGDIR"/4.1/oltp05.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp06.sql >> $LOGDIR"/4.1/oltp06.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp07.sql >> $LOGDIR"/4.1/oltp07.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp08.sql >> $LOGDIR"/4.1/oltp08.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp09.sql >> $LOGDIR"/4.1/oltp09.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp10.sql >> $LOGDIR"/4.1/oltp10.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp11.sql >> $LOGDIR"/4.1/oltp11.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp12.sql >> $LOGDIR"/4.1/oltp12.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp13.sql >> $LOGDIR"/4.1/oltp13.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp14.sql >> $LOGDIR"/4.1/oltp14.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp15.sql >> $LOGDIR"/4.1/oltp15.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp16.sql >> $LOGDIR"/4.1/oltp16.log"  2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp17.sql >> $LOGDIR"/4.1/oltp17.log"  2>&1 &

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
