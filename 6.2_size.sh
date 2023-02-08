#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1
###### query start
psql -U udba -d gpkrtpch -e > $LOGFILE 2>&1 <<-!

select sotaidschemaname schema_nm
     , split_part(sotaidtablename, '_1_prt_', 1) tb_nm
     , round(sum(sotaidtablesize)/1024/1024) tb_size_mb
     , round(sum(sotaididxsize)/1024/1024)   ix_size_mb
from   gp_toolkit.gp_size_of_table_and_indexes_disk
where  sotaidschemaname = 'gpkrtpch'
and    split_part(sotaidtablename, '_1_prt_', 1) like 'customer%'
group by 1,2
order by 1,2;

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
