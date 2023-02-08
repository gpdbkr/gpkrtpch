set optimizer=off;
/*
drop table if exists tpch.order_random_ctas;
create table tpch.order_random_ctas
as
select * from tpch.order_random
distributed randomly;
*/

--select a.*, b.* from tpch.order_random a, tpch.order_random b
--where a.o_orderkey = b.o_orderkey;

--explain
select count(*) from tpch.order_random 
where o_orderkey in (select a.o_orderkey from tpch.order_random a, tpch.order_random b);

--select *  from  tpch.order_random;

--copy tpch.order_random to stdout;
