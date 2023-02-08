#!/bin/bash

BMT_NO=$0
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1

###### query start
psql -U gpadmin -e > $LOGFILE 2>&1 <<-!

/* Resource GROUP */

CREATE RESOURCE GROUP rgoltp  WITH (CONCURRENCY=20, CPU_RATE_LIMIT=20,MEMORY_LIMIT=20);
CREATE RESOURCE GROUP rgadhoc WITH (CONCURRENCY=10, CPU_RATE_LIMIT=10,MEMORY_LIMIT=10);
CREATE RESOURCE GROUP rgbatch WITH (CONCURRENCY=5, CPU_RATE_LIMIT=10,MEMORY_LIMIT=10);


ALTER ROLE uoltp  RESOURCE GROUP rgoltp;
ALTER ROLE uadhoc RESOURCE GROUP rgadhoc; 
ALTER ROLE udba   RESOURCE GROUP rgbatch;

!
###### query end
END_TM1=`date "+%Y-%m-%d %H:%M:%S"`

SHMS=`echo $START_TM1 | awk '{print $2}'`
EHMS=`echo $END_TM1   | awk '{print $2}'`

SEC1=`date +%s -d ${SHMS}`
SEC2=`date +%s -d ${EHMS}`
DIFFSEC=`expr ${SEC2} - ${SEC1}`

echo "$0: End TIME : "$END_TM1
echo $BMT_NO"|"$START_TM1"|"$END_TM1"|"$DIFFSEC
echo $BMT_NO"|"$START_TM1"|"$END_TM1"|"$DIFFSEC >> $LOGFILE
