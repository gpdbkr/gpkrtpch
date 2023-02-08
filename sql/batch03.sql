drop table if exists partsupp_batch;
create table partsupp_batch
as
select * from partsupp;
