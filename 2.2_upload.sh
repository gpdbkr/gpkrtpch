#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1
###### query start

gpload -f $BASEDIR/yml/customer.yml          -v >  $BASEDIR/log/load_customer.log       2>&1   &
gpload -f $BASEDIR/yml/lineitem.yml          -v >  $BASEDIR/log/load_lineitem.log       2>&1   &
gpload -f $BASEDIR/yml/nation.yml            -v >  $BASEDIR/log/load_nation.log         2>&1   &
gpload -f $BASEDIR/yml/orders.yml            -v >  $BASEDIR/log/load_orders.log         2>&1   &
gpload -f $BASEDIR/yml/partsupp.yml          -v >  $BASEDIR/log/load_partsupp.log       2>&1   &
gpload -f $BASEDIR/yml/part.yml              -v >  $BASEDIR/log/load_part.log           2>&1   &
gpload -f $BASEDIR/yml/region.yml            -v >  $BASEDIR/log/load_region.log         2>&1   &
gpload -f $BASEDIR/yml/supplier.yml          -v >  $BASEDIR/log/load_supplier.log       2>&1   &

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
