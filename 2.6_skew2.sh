#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1
###### query start
psql -U udba -d gpkrtpch -e > $LOGFILE 2>&1 <<-!

SELECT 'customer' tb_nm, sum(row_count) t_cnt, Avg(Row_Count) avg_cnt, max(Row_Count) max_cnt,(1-(Avg(Row_Count)/Max(Row_Count)))*100 as Skew_Pct FROM (SELECT gp_segment_id, count(*) as Row_Count FROM customer  GROUP BY gp_segment_id ) A;
SELECT 'lineitem' tb_nm, sum(row_count) t_cnt, Avg(Row_Count) avg_cnt, max(Row_Count) max_cnt,(1-(Avg(Row_Count)/Max(Row_Count)))*100 as Skew_Pct FROM (SELECT gp_segment_id, count(*) as Row_Count FROM lineitem  GROUP BY gp_segment_id ) A;
SELECT 'nation  ' tb_nm, sum(row_count) t_cnt, Avg(Row_Count) avg_cnt, max(Row_Count) max_cnt,(1-(Avg(Row_Count)/Max(Row_Count)))*100 as Skew_Pct FROM (SELECT gp_segment_id, count(*) as Row_Count FROM nation    GROUP BY gp_segment_id ) A;
SELECT 'orders  ' tb_nm, sum(row_count) t_cnt, Avg(Row_Count) avg_cnt, max(Row_Count) max_cnt,(1-(Avg(Row_Count)/Max(Row_Count)))*100 as Skew_Pct FROM (SELECT gp_segment_id, count(*) as Row_Count FROM orders    GROUP BY gp_segment_id ) A;
SELECT 'part    ' tb_nm, sum(row_count) t_cnt, Avg(Row_Count) avg_cnt, max(Row_Count) max_cnt,(1-(Avg(Row_Count)/Max(Row_Count)))*100 as Skew_Pct FROM (SELECT gp_segment_id, count(*) as Row_Count FROM part      GROUP BY gp_segment_id ) A;
SELECT 'partsupp' tb_nm, sum(row_count) t_cnt, Avg(Row_Count) avg_cnt, max(Row_Count) max_cnt,(1-(Avg(Row_Count)/Max(Row_Count)))*100 as Skew_Pct FROM (SELECT gp_segment_id, count(*) as Row_Count FROM partsupp  GROUP BY gp_segment_id ) A;
SELECT 'region  ' tb_nm, sum(row_count) t_cnt, Avg(Row_Count) avg_cnt, max(Row_Count) max_cnt,(1-(Avg(Row_Count)/Max(Row_Count)))*100 as Skew_Pct FROM (SELECT gp_segment_id, count(*) as Row_Count FROM region    GROUP BY gp_segment_id ) A;
SELECT 'supplier' tb_nm, sum(row_count) t_cnt, Avg(Row_Count) avg_cnt, max(Row_Count) max_cnt,(1-(Avg(Row_Count)/Max(Row_Count)))*100 as Skew_Pct FROM (SELECT gp_segment_id, count(*) as Row_Count FROM supplier  GROUP BY gp_segment_id ) A;

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
