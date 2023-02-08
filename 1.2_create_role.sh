#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1

###### query start
psql -U gpadmin -d gpkrtpch -e > $LOGFILE 2>&1 <<-!

/* Drop Object*/
DROP SCHEMA IF EXISTS  gpkrtpch CASCADE;
DROP SCHEMA IF EXISTS  gpkrtpch_err CASCADE;

DROP RESOURCE GROUP rgoltp;
DROP RESOURCE GROUP rgadhoc;
DROP RESOURCE GROUP rgbatch;

DROP ROLE IF EXISTS udba;
DROP ROLE IF EXISTS uadhoc;
DROP ROLE IF EXISTS uoltp;
DROP ROLE IF EXISTS uetl;

/* Resource Group */
CREATE RESOURCE GROUP rgoltp WITH (concurrency=30, cpu_rate_limit=30, memory_limit=0);
CREATE RESOURCE GROUP rgadhoc WITH (concurrency=30, cpu_rate_limit=20, memory_limit=0);
CREATE RESOURCE GROUP rgbatch WITH (concurrency=30, cpu_rate_limit=10, memory_limit=0);

/* Role */
CREATE ROLE uoltp   LOGIN ENCRYPTED PASSWORD 'changeme' ; 
CREATE ROLE uadhoc  LOGIN ENCRYPTED PASSWORD 'changeme' ;
CREATE ROLE udba    LOGIN ENCRYPTED PASSWORD 'changeme' ;
CREATE ROLE uetl    LOGIN ENCRYPTED PASSWORD 'changeme' ;

alter role udba with CREATEEXTTABLE;

/* Assign role to resource group */
alter role uoltp  resource group rgoltp;
alter role uadhoc resource group rgadhoc;
alter role udba   resource group rgbatch;
alter role uetl   resource group rgbatch;

/* Schema */
CREATE SCHEMA gpkrtpch;
CREATE SCHEMA gpkrtpch_err;

/* Role Configuration */
ALTER ROLE uoltp   SET search_path=gpkrtpch,gpkrtpch_err,public,pg_catalog;
ALTER ROLE uadhoc  SET search_path=gpkrtpch,gpkrtpch_err,public,pg_catalog;
ALTER ROLE udba    SET search_path=gpkrtpch,gpkrtpch_err,public,pg_catalog;


/* Grant */
GRANT ALL ON SCHEMA gpkrtpch, gpkrtpch_err TO uoltp ;
GRANT ALL ON SCHEMA gpkrtpch, gpkrtpch_err TO uadhoc ;
GRANT ALL ON SCHEMA gpkrtpch, gpkrtpch_err TO udba   ;

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
