select a.*
from   tpch.orders a
    ,  (select distinct a.c_custkey  
        from tpch.customer a, tpch.customer b
        where a.c_custkey = b.c_custkey
        group by 1) b
where  a.o_custkey = b.c_custkey
;
