drop table if exists lineitem_batch;
create table lineitem_batch
as
select * from lineitem
where l_shipdate >= '19920101'::date
and   l_shipdate <  '19930101'::date
distributed randomly
;

