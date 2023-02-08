#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1

###### query start
psql -U gpadmin -d template1 -e > $LOGFILE 2>&1 <<-!

drop database if exists gpkrtpch;
create database gpkrtpch encoding='UTF8';

select 'gpkrtpch' dbname, pg_size_pretty(pg_Database_size('gpkrtpch'));
\dt *.*

select * from gp_segment_configuration order by 1;

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
