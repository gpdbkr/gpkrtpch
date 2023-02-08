drop table if exists customer_batch;
create table customer_batch
as
select * from customer
distributed randomly
;

