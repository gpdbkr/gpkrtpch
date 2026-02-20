#!/bin/bash

BMT_NO=$0
BASEDIR=`pwd -P`
LOGDIR=$BASEDIR/log
LOGFILE=$LOGDIR"/"$BMT_NO".log"

START_TM1=`date "+%Y-%m-%d %H:%M:%S"`
echo "$0: START TIME : " $START_TM1
###### query start
psql -U udba -d gpkrtpch -e > $LOGFILE 2>&1 <<-!

-- 코멘트 추가 
COMMENT ON TABLE orders       IS '주문 정보';
COMMENT ON TABLE supplier     IS '공급자 정보';
COMMENT ON TABLE partsupp     IS '부품-공급자 관계';
COMMENT ON TABLE region       IS '지역 정보';
COMMENT ON TABLE part         IS '부품 정보';
COMMENT ON TABLE customer     IS '고객 정보';
COMMENT ON TABLE nation       IS '국가 정보';
COMMENT ON TABLE lineitem     IS '주문 라인 상세정보';


COMMENT ON COLUMN gpkrtpch.nation.n_nationkey              IS '국가코드' ;
COMMENT ON COLUMN gpkrtpch.nation.n_name                   IS '국가명' ;
COMMENT ON COLUMN gpkrtpch.nation.n_regionkey              IS '지역코드' ;
COMMENT ON COLUMN gpkrtpch.nation.n_comment                IS '국가코멘트' ;

COMMENT ON COLUMN gpkrtpch.region.r_regionkey              IS '지역코드' ;
COMMENT ON COLUMN gpkrtpch.region.r_name                   IS '지역명' ;
COMMENT ON COLUMN gpkrtpch.region.r_comment                IS '지역 코멘트' ;

COMMENT ON COLUMN gpkrtpch.part.p_partkey                  IS '상품코드' ;
COMMENT ON COLUMN gpkrtpch.part.p_name                     IS '명' ;
COMMENT ON COLUMN gpkrtpch.part.p_mfgr                     IS '제조사' ;
COMMENT ON COLUMN gpkrtpch.part.p_brand                    IS '브렌드' ;
COMMENT ON COLUMN gpkrtpch.part.p_type                     IS '상품 유형' ;
COMMENT ON COLUMN gpkrtpch.part.p_size                     IS '상품 사이즈' ;
COMMENT ON COLUMN gpkrtpch.part.p_container                IS '상품 포장' ;
COMMENT ON COLUMN gpkrtpch.part.p_retailprice              IS '소비자가격' ;
COMMENT ON COLUMN gpkrtpch.part.p_comment                  IS '상품 코멘트' ;

COMMENT ON COLUMN gpkrtpch.supplier.s_suppkey              IS '공급자코드' ;
COMMENT ON COLUMN gpkrtpch.supplier.s_name                 IS '공급자명' ;
COMMENT ON COLUMN gpkrtpch.supplier.s_address              IS '공급자주소' ;
COMMENT ON COLUMN gpkrtpch.supplier.s_nationkey            IS '공급자국가코드' ;
COMMENT ON COLUMN gpkrtpch.supplier.s_phone                IS '공급자전화번호' ;
COMMENT ON COLUMN gpkrtpch.supplier.s_acctbal              IS '공급자 계좌잔액' ;
COMMENT ON COLUMN gpkrtpch.supplier.s_comment              IS '공급자 코멘트' ;

COMMENT ON COLUMN gpkrtpch.partsupp.ps_partkey             IS '상품코드' ;
COMMENT ON COLUMN gpkrtpch.partsupp.ps_suppkey             IS '상품 공급자 코드' ;
COMMENT ON COLUMN gpkrtpch.partsupp.ps_availqty            IS '가용 수량' ;
COMMENT ON COLUMN gpkrtpch.partsupp.ps_supplycost          IS '공급 단가' ;
COMMENT ON COLUMN gpkrtpch.partsupp.ps_comment             IS '부품 공급자 코멘트' ;

COMMENT ON COLUMN gpkrtpch.customer.c_custkey              IS '고객코드' ;
COMMENT ON COLUMN gpkrtpch.customer.c_name                 IS '고객명' ;
COMMENT ON COLUMN gpkrtpch.customer.c_address              IS '고객주소' ;
COMMENT ON COLUMN gpkrtpch.customer.c_nationkey            IS '국가코드' ;
COMMENT ON COLUMN gpkrtpch.customer.c_phone                IS '고객전화번호' ;
COMMENT ON COLUMN gpkrtpch.customer.c_acctbal              IS '고객 계좌 잔액' ;
COMMENT ON COLUMN gpkrtpch.customer.c_mktsegment           IS '고객 마케팅 세그먼트' ;
COMMENT ON COLUMN gpkrtpch.customer.c_comment              IS '고객 코멘트' ;

SELECT t01.nspname schemaname, t02.relname, t03.attname
        , pg_catalog.col_description(t03.attrelid, 0) tb_cmt 
        , pg_catalog.col_description(t03.attrelid, t03.attnum) col_cmt 
FROM   pg_catalog.pg_namespace t01
 JOIN  pg_catalog.pg_class t02 
 ON    t01.oid = t02.relnamespace 
 JOIN  pg_catalog.pg_attribute t03
 ON    t03.attrelid = t02.oid 
WHERE  t01.nspname IN ('gpkrtpch')
 AND   t02.relname NOT LIKE '%_1_prt%'
 AND   t03.attnum > 0
 AND   t02.relkind IN ('r')
 AND   t02.relname NOT IN ('customer_com_row', 'customer_com_col', 'test_orders')
 ;
 
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
