set gpcc.query_tags to 'appname=mstr';
select s_name, count(*) from supplier where s_suppkey between 18101 and 18111 group by 1 order by 1;
select  c_custkey, count(*) cnt  from  customer where  c_custkey in( 908097, 9022) group by 1 ;
select p_size, count(*)  from part where p_partkey between 12212 and 12223 group by 1 order by 1;
select * from orders where o_orderkey between  1121 and 1121 order by 1;
select s_address, count(*) from supplier where s_suppkey between 34353 and 34355 group by 1 order by 1;
select c_address, count(*) from customer where c_custkey between 9696 and 9699 group by 1 order by 1 ;
select * from orders where o_orderkey between  978978 and 978980 order by 1;
select  c_name, c_custkey  from  customer where  c_custkey in (970, 1057, 953536) ;
select o_custkey, count(*) from orders where o_custkey = 252353 group by 1;
select c_phone, count(*) from customer where c_custkey between 74754 and 74757 group by 1  order by 1 ;
