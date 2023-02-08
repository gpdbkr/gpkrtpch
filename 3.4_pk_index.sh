#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1
###### query start
#psql -U udba -d gpkrtpch -ec "ALTER TABLE part     ADD CONSTRAINT part_pkey     PRIMARY KEY (P_PARTKEY);  ;" > $LOGDIR"/ix_part.log"    2>&1 &
#psql -U udba -d gpkrtpch -ec "ALTER TABLE region   ADD CONSTRAINT region_pkey   PRIMARY KEY (R_REGIONKEY) ;" > $LOGDIR"/ix_region.log"  2>&1 &
#psql -U udba -d gpkrtpch -ec "ALTER TABLE nation   ADD CONSTRAINT nation_pkey   PRIMARY KEY (N_NATIONKEY) ;" > $LOGDIR"/ix_nation.log"  2>&1 &
#psql -U udba -d gpkrtpch -ec "ALTER TABLE SUPPLIER ADD CONSTRAINT supplier_pkey PRIMARY KEY (S_SUPPKEY);  ;" > $LOGDIR"/ix_supplier.log" 2>&1 &
#psql -U udba -d gpkrtpch -ec "ALTER TABLE CUSTOMER ADD CONSTRAINT customer_pkey PRIMARY KEY (C_CUSTKEY);  ;" > $LOGDIR"/ix_customer.log" 2>&1 &

psql -U udba -d gpkrtpch -ec "create index part_ix     on part    (P_PARTKEY);  ;" > $LOGDIR"/ix_part.log"    2>&1 &
psql -U udba -d gpkrtpch -ec "create index region_ix   on region  (R_REGIONKEY) ;" > $LOGDIR"/ix_region.log"  2>&1 &
psql -U udba -d gpkrtpch -ec "create index nation_ix   on nation  (N_NATIONKEY) ;" > $LOGDIR"/ix_nation.log"  2>&1 &
psql -U udba -d gpkrtpch -ec "create index supplier_ix on SUPPLIER(S_SUPPKEY);  ;" > $LOGDIR"/ix_supplier.log" 2>&1 &
psql -U udba -d gpkrtpch -ec "create index customer_ix on CUSTOMER(C_CUSTKEY);  ;" > $LOGDIR"/ix_customer.log" 2>&1 &

psql -U udba -d gpkrtpch -ec "create index O_ORDERKEY_ix on ORDERS(O_ORDERKEY);  " > $LOGDIR"/ix_orders.log" 2>&1 &
psql -U udba -d gpkrtpch -ec "create index l_orderkey_ix on lineitem(l_orderkey);" > $LOGDIR"/ix_lineitem.log" 2>&1 &

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
