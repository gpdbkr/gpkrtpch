#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1
###### query start
psql -U udba -d gpkrtpch -e > $LOGFILE 2>&1 <<-!

select 'gpkrtpch.customer' tb_nm, count(*) from  gpkrtpch.customer;
select 'gpkrtpch.lineitem' tb_nm, count(*) from  gpkrtpch.lineitem;
select 'gpkrtpch.nation  ' tb_nm, count(*) from  gpkrtpch.nation;
select 'gpkrtpch.orders  ' tb_nm, count(*) from  gpkrtpch.orders;
select 'gpkrtpch.part    ' tb_nm, count(*) from  gpkrtpch.part;
select 'gpkrtpch.partsupp' tb_nm, count(*) from  gpkrtpch.partsupp;
select 'gpkrtpch.region  ' tb_nm, count(*) from  gpkrtpch.region;
select 'gpkrtpch.supplier' tb_nm, count(*) from  gpkrtpch.supplier;

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
