set gpcc.query_tags to 'appname=mstr';

select s_acctbal, count(*) from supplier where s_suppkey between 9876 and 9877 group by 1 order by 1;
select * from orders where o_orderkey between  12625 and 12725 order by 1;
select * from    lineitem  where   l_orderkey = 221 ;
select * from    lineitem  where   l_orderkey = 12221 order by 1 ;
select  c_custkey, count(*) cnt   from  customer where  c_custkey = 19383 group by 1 order by 1;
select * from orders where o_orderkey between  191919 and 191940 order by 1;
select count(*) from part where p_partkey between 3030 and 3031 order by 1;
select l_orderkey, count(*) from    lineitem  where   l_orderkey = 1602111 group by 1 ;
select count(*) From nation where n_nationkey <= 4 ;
select * from orders where o_orderkey between  23261 and 23291 order by 1;
