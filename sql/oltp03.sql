set gpcc.query_tags to 'appname=mstr';
select o_custkey, count(*) from orders where o_custkey = 155377 group by 1;
select * from orders where o_orderkey between  2928729 and 2929029 order by 1;
select c_comment, count(*) from customer where c_custkey between 58463 and 58465  group by 1 order by 1 ;
select c_name, count(*) from customer where c_custkey between 8744 and 8745 group by 1 order by 1 ;
select * from part where p_partkey = 1318  order by 1;
select * From nation where n_nationkey = 10 ;
select o_custkey, count(*) from orders where o_custkey = 3353121 group by 1;
select * from orders where o_orderkey = 68227  order by 1;
select * From nation where n_name = 'EGYPT' ;
select o_custkey, count(*) from orders where o_custkey = 172363 group by 1;
