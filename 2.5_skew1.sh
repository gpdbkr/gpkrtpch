#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1
###### query start
psql -U udba -d gpkrtpch -e > $LOGFILE 2>&1 <<-!

select 'gpkrtpch.customer' tb_nm, gp_segment_id, count(*) from  gpkrtpch.customer  group by gp_segment_id order by 2;
select 'gpkrtpch.lineitem' tb_nm, gp_segment_id, count(*) from  gpkrtpch.lineitem  group by gp_segment_id order by 2;
select 'gpkrtpch.orders  ' tb_nm, gp_segment_id, count(*) from  gpkrtpch.orders    group by gp_segment_id order by 2;
select 'gpkrtpch.part    ' tb_nm, gp_segment_id, count(*) from  gpkrtpch.part      group by gp_segment_id order by 2;
select 'gpkrtpch.partsupp' tb_nm, gp_segment_id, count(*) from  gpkrtpch.partsupp  group by gp_segment_id order by 2;
select 'gpkrtpch.region  ' tb_nm, gp_segment_id, count(*) from  gpkrtpch.region    group by gp_segment_id order by 2;
select 'gpkrtpch.supplier' tb_nm, gp_segment_id, count(*) from  gpkrtpch.supplier  group by gp_segment_id order by 2;

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
