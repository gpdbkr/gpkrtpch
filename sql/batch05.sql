drop table if exists lineimte_batch;
create table lineitem_batch
as
select * from lineitem
where l_shipdate >= '19920101'::date
and   l_shipdate <  '19930101'::date;

