set gpcc.query_tags to 'appname=mstr';

select l_orderkey, count(*) from    lineitem  where   l_orderkey = 16031111 group by 1 ;
select count(*) From nation where n_nationkey <= 10 ;
select * from orders where o_orderkey between  16261 and 16291 order by 1;
select p_name,count(*) from part where p_partkey between 87644 and 87645 group by 1 order by 1;
select l_orderkey, count(*) from    lineitem  where   l_orderkey = 1621 group by 1 ;
select * from customer where c_custkey between 95287 and 95287 order by 1 ;
select * From nation where n_name = 'MOROCCO' ;
select s_nationkey, count(*) from supplier where s_suppkey between 1111 and 1133 group by 1 order by 1;
select s_name, count(*) from supplier where s_suppkey between 10910 and 10915 group by 1 order by 1;
select  c_custkey, count(*) cnt  from  customer where  c_custkey in( 382828, 12822) group by 1 ;
