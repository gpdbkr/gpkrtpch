drop table if exists supplier_batch;
create table supplier_batch
as
select * from supplier
distributed randomly
;

