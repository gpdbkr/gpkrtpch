#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"
mkdir -p $LOGDIR/5.1

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1

###### query start

psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp01.sql > $LOGDIR"/5.1/oltp01.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp02.sql > $LOGDIR"/5.1/oltp02.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp03.sql > $LOGDIR"/5.1/oltp03.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp04.sql > $LOGDIR"/5.1/oltp04.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp05.sql > $LOGDIR"/5.1/oltp05.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp06.sql > $LOGDIR"/5.1/oltp06.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp07.sql > $LOGDIR"/5.1/oltp07.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp08.sql > $LOGDIR"/5.1/oltp08.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp09.sql > $LOGDIR"/5.1/oltp09.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp10.sql > $LOGDIR"/5.1/oltp10.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp11.sql > $LOGDIR"/5.1/oltp11.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp12.sql > $LOGDIR"/5.1/oltp12.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp13.sql > $LOGDIR"/5.1/oltp13.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp14.sql > $LOGDIR"/5.1/oltp14.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp15.sql > $LOGDIR"/5.1/oltp15.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp16.sql > $LOGDIR"/5.1/oltp16.log" 2>&1 &
psql -U uoltp -d gpkrtpch -ef $BASEDIR/query/oltp17.sql > $LOGDIR"/5.1/oltp17.log" 2>&1 &

psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query01.sql > $LOGDIR"/5.1/query01.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query02.sql > $LOGDIR"/5.1/query02.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query03.sql > $LOGDIR"/5.1/query03.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query04.sql > $LOGDIR"/5.1/query04.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query05.sql > $LOGDIR"/5.1/query05.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query06.sql > $LOGDIR"/5.1/query06.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query07.sql > $LOGDIR"/5.1/query07.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query08.sql > $LOGDIR"/5.1/query08.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query10.sql > $LOGDIR"/5.1/query10.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query11.sql > $LOGDIR"/5.1/query11.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query12.sql > $LOGDIR"/5.1/query12.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query13.sql > $LOGDIR"/5.1/query13.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query14.sql > $LOGDIR"/5.1/query14.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query15.sql > $LOGDIR"/5.1/query15.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query16.sql > $LOGDIR"/5.1/query16.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query17.sql > $LOGDIR"/5.1/query17.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query19.sql > $LOGDIR"/5.1/query19.log" 2>&1 &
#psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query21.sql > $LOGDIR"/5.1/query21.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query22.sql > $LOGDIR"/5.1/query22.log" 2>&1 &
psql -U uadhoc -d gpkrtpch -ef $BASEDIR/query/query24.sql > $LOGDIR"/5.1/query24.log" 2>&1 &

psql -U udba -d gpkrtpch -ef $BASEDIR/query/batch01.sql > $LOGDIR"/5.1/batch01.log" 2>&1 &
psql -U udba -d gpkrtpch -ef $BASEDIR/query/batch02.sql > $LOGDIR"/5.1/batch02.log" 2>&1 &
psql -U udba -d gpkrtpch -ef $BASEDIR/query/batch03.sql > $LOGDIR"/5.1/batch03.log" 2>&1 &
psql -U udba -d gpkrtpch -ef $BASEDIR/query/batch04.sql > $LOGDIR"/5.1/batch04.log" 2>&1 &
psql -U udba -d gpkrtpch -ef $BASEDIR/query/batch05.sql > $LOGDIR"/5.1/batch05.log" 2>&1 &

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
