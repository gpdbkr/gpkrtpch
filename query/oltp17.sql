select * From nation where n_name = 'CHINA' ;
select s_nationkey, count(*) from supplier where s_suppkey between 8657 and 8660 group by 1 order by 1;
select s_name, count(*) from supplier where s_suppkey between 86575 and 86580 group by 1 order by 1;
select  c_custkey, count(*) cnt  from  customer where  c_custkey in( 56436, 45645,56456,456, 64654) group by 1 ;
select p_size, count(*)  from part where p_partkey between 46546 and 46550 group by 1 order by 1;
