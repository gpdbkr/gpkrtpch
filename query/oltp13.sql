select  c_name, c_custkey  from  customer where  c_custkey = 35421 ;
select o_custkey, count(*) from orders where o_custkey = 243521    group by 1;
select * From nation where n_name = 'SWISS' ;
select * from    lineitem  where   l_orderkey = 35131 ;
select * from orders where o_orderkey between  4124 and 4126 order by 1;
select o_custkey, count(*) from orders where o_custkey = 1435214 group by 1;
select * From nation where n_name = 'DENMARK' ;
select p_partkey, count(*) from part where p_partkey between 75327 and 75330 group by 1 order by 1;
select c_acctbal, count(*) from customer where c_custkey between 643634 and 643638 group by 1  order by 1 ;
select * From nation where n_nationkey = 8 ;
