set gpcc.query_tags to 'appname=mstr';
select p_name, count(*) from part where p_partkey between 97644 and 97645 group by 1 order by 1;
select l_orderkey, count(*) from    lineitem  where   l_orderkey = 15521 group by 1 ;
select * from customer where c_custkey between 1295287 and 1295287 order by 1 ;
select * From nation where n_name = 'MOROCCO' ;
select s_nationkey, count(*) from supplier where s_suppkey between 2211 and 2233 group by 1 order by 1;
select s_name, count(*) from supplier where s_suppkey between 30910 and 30915 group by 1 order by 1;
select  c_custkey, count(*) cnt  from  customer where  c_custkey in( 3332828, 1212822) group by 1 ;
select p_size, count(*)  from part where p_partkey between 445750 and 445752 group by 1 order by 1;
select * from orders where o_orderkey between  16725 and 16765 order by 1;
select s_address, count(*) from supplier where s_suppkey between 40111 and 40123 group by 1 order by 1;
