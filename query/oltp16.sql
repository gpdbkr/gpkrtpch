select p_size, count(*)  from part where p_partkey between 725346 and 725350 group by 1 order by 1;
select * from orders where o_orderkey between  3253 and 3255 order by 1;
select s_address, count(*) from supplier where s_suppkey between 643543 and 643545 group by 1 order by 1;
select c_address, count(*) from customer where c_custkey between 265443 and 265446 group by 1 order by 1 ;
select * from orders where o_orderkey between  46353 and 46357 order by 1;
select  c_name, c_custkey  from  customer where  c_custkey in (34543, 3333, 123421) ;
select o_custkey, count(*) from orders where o_custkey = 13413 group by 1;
select c_phone, count(*) from customer where c_custkey between 435243 and 435245 group by 1  order by 1 ;
select o_custkey, count(*) from orders where o_custkey = 456345 group by 1;
select * from    lineitem  where   l_orderkey = 745764 ;
