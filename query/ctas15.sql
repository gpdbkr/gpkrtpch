drop table if exists dml15;
drop view if exists revenue0;
create view revenue0 (supplier_no, total_revenue) as
	select
		l_suppkey,
		sum(l_extendedprice * (1 - l_discount))
	from
		lineitem
	where
		l_shipdate >= date '1993-01-01'
		and l_shipdate < date '1993-01-01' + interval '3 month'
	group by
		l_suppkey;


create table dml15 as
select
	s_suppkey,
	s_name,
	s_address,
	s_phone,
	total_revenue
from
	supplier,
	revenue0
where
	s_suppkey = supplier_no
	and total_revenue = (
		select
			max(total_revenue)
		from
			revenue0
	)
order by
	s_suppkey
distributed randomly
;

drop view revenue0;