set gpcc.query_tags to 'appname=mstr';
-- start_equiv
select
	p_brand,
	p_type,
	p_size,
	count(distinct ps_suppkey) as supplier_cnt
from
	partsupp,
	part
where
	p_partkey = ps_partkey
	and p_brand <> 'Brand#35'
	and p_type not like 'MEDIUM ANODIZED%'
	and p_size in (39, 31, 24, 22, 46, 20, 42, 15)
	and ps_suppkey not in (
		select
			s_suppkey
		from
			supplier
		where
			s_comment like '%Customer%Complaints%'
	)
group by
	p_brand,
	p_type,
	p_size
order by
	supplier_cnt desc,
	p_brand,
	p_type,
	p_size;

select 
	p_brand, 
	p_type, 
	p_size, 
	count(distinct ps_suppkey) as supplier_cnt 
from 
	part, 
	partsupp left join supplier on (ps_suppkey=s_suppkey and s_comment like '%Customer%Complaints%' ) 
where 
	p_partkey = ps_partkey 
	and p_brand <> 'Brand#35' 
	and p_type not like 'MEDIUM ANODIZED%' 
	and p_size in (39, 31, 24, 22, 46, 20, 42, 15)
	and s_suppkey is null 
group by 
	p_brand, 
	p_type, 
	p_size 
order by 
	supplier_cnt desc, 
	p_brand, 
	p_type, 
	p_size;

-- end_equiv
