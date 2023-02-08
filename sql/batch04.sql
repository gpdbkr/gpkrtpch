set search_path=tpch.
drop table if exists supplier_batch;
create table supplier_batch
as
select * from supplier;

