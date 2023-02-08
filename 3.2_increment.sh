#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1
###### query start

psql -U udba -d gpkrtpch -ec "
INSERT INTO gpkrtpch.lineitem(
            l_orderkey, l_partkey, l_suppkey, l_linenumber, l_quantity, l_extendedprice, 
            l_discount, l_tax, l_returnflag, l_linestatus, 
            l_shipdate, 
            l_commitdate, 
            l_receiptdate, l_shipinstruct, l_shipmode, l_comment)
SELECT      l_orderkey, l_partkey, l_suppkey, l_linenumber, l_quantity, l_extendedprice, 
            l_discount, l_tax, l_returnflag, l_linestatus, 
            l_shipdate + (trim(to_char(i*7, '99'))||'year')::interval, 
            l_commitdate, 
            l_receiptdate, l_shipinstruct, l_shipmode, l_comment
FROM        gpkrtpch.lineitem, generate_series(1,2) i ; " > $LOGDIR"/inc_lineitem.log" 2>&1 &

psql -U udba -d gpkrtpch -ec "
INSERT INTO gpkrtpch.orders(
            o_orderkey, o_custkey, o_orderstatus, o_totalprice, 
            o_orderdate, 
            o_orderpriority, o_clerk, o_shippriority, o_comment)
SELECT      o_orderkey, o_custkey, o_orderstatus, o_totalprice, 
            o_orderdate + (trim(to_char(i*7, '99'))||'year')::interval, 
            o_orderpriority, o_clerk, o_shippriority, o_comment
FROM        gpkrtpch.orders, generate_series(1,2) i ; " > $LOGDIR"/inc_orders.log" 2>&1 &


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
