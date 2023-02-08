#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1
###### query start
psql -U udba -d gpkrtpch -e > $LOGFILE 2>&1 <<-!

CREATE TABLE gpkrtpch.NATION  
( 
    N_NATIONKEY  INTEGER NOT NULL,
    N_NAME       CHAR(25) NOT NULL,
    N_REGIONKEY  INTEGER NOT NULL,
    N_COMMENT    VARCHAR(152)
)
DISTRIBUTED BY(N_NATIONKEY);

CREATE TABLE gpkrtpch.REGION  
( 
    R_REGIONKEY  INTEGER NOT NULL,
    R_NAME       CHAR(25) NOT NULL,
    R_COMMENT    VARCHAR(152)
)
DISTRIBUTED BY(R_REGIONKEY);

CREATE TABLE gpkrtpch.PART  
( 
    P_PARTKEY     INTEGER NOT NULL,
    P_NAME        VARCHAR(55) NOT NULL,
    P_MFGR        CHAR(25) NOT NULL,
    P_BRAND       CHAR(10) NOT NULL,
    P_TYPE        VARCHAR(25) NOT NULL,
    P_SIZE        INTEGER NOT NULL,
    P_CONTAINER   CHAR(10) NOT NULL,
    P_RETAILPRICE NUMERIC(15,2) NOT NULL,
    P_COMMENT     VARCHAR(23) NOT NULL 
)
DISTRIBUTED BY(P_PARTKEY);
;

CREATE TABLE gpkrtpch.SUPPLIER 
(   
    S_SUPPKEY     INTEGER NOT NULL,
    S_NAME        CHAR(25) NOT NULL,
    S_ADDRESS     VARCHAR(40) NOT NULL,
    S_NATIONKEY   INTEGER NOT NULL,
    S_PHONE       CHAR(15) NOT NULL,
    S_ACCTBAL     NUMERIC(15,2) NOT NULL,
    S_COMMENT     VARCHAR(101) NOT NULL
)
DISTRIBUTED BY(S_SUPPKEY);
;

CREATE TABLE gpkrtpch.PARTSUPP 
( 
    PS_PARTKEY     INTEGER NOT NULL,
    PS_SUPPKEY     INTEGER NOT NULL,
    PS_AVAILQTY    INTEGER NOT NULL,
    PS_SUPPLYCOST  NUMERIC(15,2)  NOT NULL,
    PS_COMMENT     VARCHAR(199) NOT NULL 
)
WITH (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib) 
DISTRIBUTED BY(PS_PARTKEY)
;

CREATE TABLE gpkrtpch.CUSTOMER 
( 
    C_CUSTKEY     INTEGER NOT NULL,
    C_NAME        VARCHAR(25) NOT NULL,
    C_ADDRESS     VARCHAR(40) NOT NULL,
    C_NATIONKEY   INTEGER NOT NULL,
    C_PHONE       CHAR(15) NOT NULL,
    C_ACCTBAL     NUMERIC(15,2)   NOT NULL,
    C_MKTSEGMENT  CHAR(10) NOT NULL,
    C_COMMENT     VARCHAR(117) NOT NULL
)
DISTRIBUTED BY(C_CUSTKEY)
;


CREATE TABLE gpkrtpch.ORDERS  
( 
    O_ORDERKEY       INT8 NOT NULL,
    O_CUSTKEY        INTEGER NOT NULL,
    O_ORDERSTATUS    CHAR(1) NOT NULL,
    O_TOTALPRICE     NUMERIC(15,2) NOT NULL,
    O_ORDERDATE      DATE NOT NULL,
    O_ORDERPRIORITY  CHAR(15) NOT NULL,
    O_CLERK          CHAR(15) NOT NULL,
    O_SHIPPRIORITY   INTEGER NOT NULL,
    O_COMMENT        VARCHAR(79) NOT NULL
) 
with (appendonly=true)
DISTRIBUTED BY(O_ORDERKEY)
partition by range(o_orderdate)
(
	partition p1992 start('1992-01-01') end ('1993-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib), 
	partition p1993 start('1993-01-01') end ('1994-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p1994 start('1994-01-01') end ('1995-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p1995 start('1995-01-01') end ('1996-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p1996 start('1996-01-01') end ('1997-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p1997 start('1997-01-01') end ('1998-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p1998 start('1998-01-01') end ('1999-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p1999 start('1999-01-01') end ('2001-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p2001 start('2001-01-01') end ('2002-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p2002 start('2002-01-01') end ('2003-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p2003 start('2003-01-01') end ('2004-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p2004 start('2004-01-01') end ('2005-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p2005 start('2005-01-01') end ('2006-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p2006 start('2006-01-01') end ('2007-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p2007 start('2007-01-01') end ('2008-01-01') ,
	partition p2008 start('2008-01-01') end ('2009-01-01') ,
	partition p2009 start('2009-01-01') end ('2010-01-01') ,
	partition p2010 start('2010-01-01') end ('2011-01-01') ,
	partition p2011 start('2011-01-01') end ('2012-01-01') ,
	partition p2012 start('2012-01-01') end ('2013-01-01') ,
	partition p2013 start('2013-01-01') end ('2014-01-01') ,
  DEFAULT PARTITION pother 
);

CREATE TABLE gpkrtpch.LINEITEM 
(   L_ORDERKEY    INT8 NOT NULL,
    L_PARTKEY     INTEGER NOT NULL,
    L_SUPPKEY     INTEGER NOT NULL,
    L_LINENUMBER  INTEGER NOT NULL,
    L_QUANTITY    NUMERIC(15,2) NOT NULL,
    L_EXTENDEDPRICE  NUMERIC(15,2) NOT NULL,
    L_DISCOUNT    NUMERIC(15,2) NOT NULL,
    L_TAX         NUMERIC(15,2) NOT NULL,
    L_RETURNFLAG  CHAR(1) NOT NULL,
    L_LINESTATUS  CHAR(1) NOT NULL,
    L_SHIPDATE    DATE NOT NULL,
    L_COMMITDATE  DATE NOT NULL,
    L_RECEIPTDATE DATE NOT NULL,
    L_SHIPINSTRUCT CHAR(25) NOT NULL,
    L_SHIPMODE     CHAR(10) NOT NULL,
    L_COMMENT      VARCHAR(44) NOT NULL
) 
with (appendonly=true)
DISTRIBUTED BY(L_ORDERKEY)
partition by range (l_shipdate)
(
	partition p1992 start('1992-01-01') end ('1993-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib), 
	partition p1993 start('1993-01-01') end ('1994-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p1994 start('1994-01-01') end ('1995-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p1995 start('1995-01-01') end ('1996-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p1996 start('1996-01-01') end ('1997-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p1997 start('1997-01-01') end ('1998-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p1998 start('1998-01-01') end ('1999-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p1999 start('1999-01-01') end ('2001-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p2001 start('2001-01-01') end ('2002-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p2002 start('2002-01-01') end ('2003-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p2003 start('2003-01-01') end ('2004-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p2004 start('2004-01-01') end ('2005-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p2005 start('2005-01-01') end ('2006-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p2006 start('2006-01-01') end ('2007-01-01') with (appendonly=true, compresslevel=1, orientation=column, compresstype=zlib),
	partition p2007 start('2007-01-01') end ('2008-01-01') ,
	partition p2008 start('2008-01-01') end ('2009-01-01') ,
	partition p2009 start('2009-01-01') end ('2010-01-01') ,
	partition p2010 start('2010-01-01') end ('2011-01-01') ,
	partition p2011 start('2011-01-01') end ('2012-01-01') ,
	partition p2012 start('2012-01-01') end ('2013-01-01') ,
	partition p2013 start('2013-01-01') end ('2014-01-01') ,
  DEFAULT PARTITION pother 
);


CREATE TABLE gpkrtpch.CUSTOMER_COM_ROW 
( 
    C_CUSTKEY     INTEGER NOT NULL,
    C_NAME        VARCHAR(25) NOT NULL,
    C_ADDRESS     VARCHAR(40) NOT NULL,
    C_NATIONKEY   INTEGER NOT NULL,
    C_PHONE       CHAR(15) NOT NULL,
    C_ACCTBAL     NUMERIC(15,2)   NOT NULL,
    C_MKTSEGMENT  CHAR(10) NOT NULL,
    C_COMMENT     VARCHAR(117) NOT NULL
)
WITH (appendonly=true, compresstype=zlib, compresslevel=1)
DISTRIBUTED BY(C_CUSTKEY)
;

CREATE TABLE gpkrtpch.CUSTOMER_COM_COL 
( 
    C_CUSTKEY     INTEGER NOT NULL,
    C_NAME        VARCHAR(25) NOT NULL,
    C_ADDRESS     VARCHAR(40) NOT NULL,
    C_NATIONKEY   INTEGER NOT NULL,
    C_PHONE       CHAR(15) NOT NULL,
    C_ACCTBAL     NUMERIC(15,2)   NOT NULL,
    C_MKTSEGMENT  CHAR(10) NOT NULL,
    C_COMMENT     VARCHAR(117) NOT NULL
)
WITH (appendonly=true, compresstype=zlib, compresslevel=1, orientation=column)
DISTRIBUTED BY(C_CUSTKEY)
;

grant all on gpkrtpch.nation to udba,uadhoc,uoltp;
grant all on gpkrtpch.region to udba,uadhoc,uoltp;
grant all on gpkrtpch.part to udba,uadhoc,uoltp;
grant all on gpkrtpch.supplier to udba,uadhoc,uoltp;
grant all on gpkrtpch.partsupp to udba,uadhoc,uoltp;
grant all on gpkrtpch.customer to udba,uadhoc,uoltp;
grant all on gpkrtpch.customer_com_row to udba,uadhoc,uoltp;
grant all on gpkrtpch.customer_com_col to udba,uadhoc,uoltp;
grant all on gpkrtpch.lineitem to udba,uadhoc,uoltp;
grant all on gpkrtpch.orders to udba,uadhoc,uoltp;

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
