select l_orderkey, count(*) from    lineitem  where   l_orderkey = 16031111 group by 1 ;
select count(*) From nation where n_nationkey <= 10 ;
select * from orders where o_orderkey between  16261 and 16291 order by 1;
select p_name,count(*) from part where p_partkey between 87644 and 87645 group by 1 order by 1;
select l_orderkey, count(*) from    lineitem  where   l_orderkey = 1621 group by 1 ;
select * from customer where c_custkey between 95287 and 95287 order by 1 ;
select * From nation where n_name = 'MOROCCO' ;
select s_nationkey, count(*) from supplier where s_suppkey between 1111 and 1133 group by 1 order by 1;
select s_name, count(*) from supplier where s_suppkey between 10910 and 10915 group by 1 order by 1;
select  c_custkey, count(*) cnt  from  customer where  c_custkey in( 382828, 12822) group by 1 ;
select p_size, count(*)  from part where p_partkey between 585750 and 585752 group by 1 order by 1;
select * from orders where o_orderkey between  1725 and 1765 order by 1;
select s_address, count(*) from supplier where s_suppkey between 19111 and 19123 group by 1 order by 1;
select c_address, count(*) from customer where c_custkey between 9587 and 9587 group by 1 order by 1 ;
select * from orders where o_orderkey between  1822 and 1880 order by 1;
select  c_name, c_custkey  from  customer where  c_custkey in (95370, 105657, 95356) ;
select c_phone, count(*) from customer where c_custkey between 987766 and 987768 group by 1  order by 1 ;
select o_custkey, count(*) from orders where o_custkey = 2155366 group by 1;
select * from    lineitem  where   l_orderkey = 1132333 ;
select  c_name, c_custkey  from  customer where  c_custkey = 96786 ;
select o_custkey, count(*) from orders where o_custkey = 155377 group by 1;
select * from orders where o_orderkey between  2928729 and 2929029 order by 1;
select c_comment, count(*) from customer where c_custkey between 58463 and 58465  group by 1 order by 1 ;
select c_name, count(*) from customer where c_custkey between 8744 and 8745 group by 1 order by 1 ;
select * from part where p_partkey = 1318  order by 1;
select * From nation where n_nationkey = 10 ;
select o_custkey, count(*) from orders where o_custkey = 3353121 group by 1;
select * from orders where o_orderkey = 68227  order by 1;
select * From nation where n_name = 'EGYPT' ;
select o_custkey, count(*) from orders where o_custkey = 172363 group by 1;
select * from orders where o_orderkey = 1318  order by 1;
select o_custkey, count(*) from orders where o_custkey = 272633 group by 1;
select p_name, count(*) from part where p_partkey between 191920 and 191922 group by 1 order by 1;
select s_acctbal, count(*) from supplier where s_suppkey between 69696 and 69699 group by 1 order by 1;
select c_nationkey, count(*) from customer where c_custkey between 11287 and 11287 group by 1 order by 1 ;
select p_type, count(*) from part where p_partkey between 49585 and 49585 group by 1 order by 1;
select * from supplier where s_suppkey between 10782 and 10782 order by 1;
select  c_name, c_custkey  from  customer where  c_custkey = 1818111 ;
select o_custkey, count(*) from orders where o_custkey = 2333    group by 1;
select * From nation where n_name = 'ETHIOPIA' ;
select * from    lineitem  where   l_orderkey = 11601223 ;
select * from orders where o_orderkey between  2727 and 2730 order by 1;
select o_custkey, count(*) from orders where o_custkey = 3355967 group by 1;
select * From nation where n_name = 'VIETNAM' ;
select p_partkey, count(*) from part where p_partkey between 10292 and 10291 group by 1 order by 1;
select c_acctbal, count(*) from customer where c_custkey between 18273 and 18275 group by 1  order by 1 ;
select * From nation where n_nationkey = 1 ;
select  c_name, count(*)  from  customer where  c_custkey = 104445  group by 1 order by 1;
select s_phone, count(*) from supplier where s_suppkey between 1234 and 1237 group by 1 order by 1;
select  c_name, c_custkey  from  customer where  c_custkey = 17171 ;
select s_acctbal, count(*) from supplier where s_suppkey between 9876 and 9877 group by 1 order by 1;
select * from orders where o_orderkey between  12625 and 12725 order by 1;
select * from    lineitem  where   l_orderkey = 221 ;
select * from    lineitem  where   l_orderkey = 12221 order by 1 ;
select  c_custkey, count(*) cnt   from  customer where  c_custkey = 19383 group by 1 order by 1;
select * from orders where o_orderkey between  191919 and 191940 order by 1;
select count(*) from part where p_partkey between 3030 and 3031 order by 1;
select l_orderkey, count(*) from    lineitem  where   l_orderkey = 1602111 group by 1 ;
select count(*) From nation where n_nationkey <= 4 ;
select * from orders where o_orderkey between  23261 and 23291 order by 1;
select p_name, count(*) from part where p_partkey between 97644 and 97645 group by 1 order by 1;
select l_orderkey, count(*) from    lineitem  where   l_orderkey = 15521 group by 1 ;
select * from customer where c_custkey between 1295287 and 1295287 order by 1 ;
select * From nation where n_name = 'MOROCCO' ;
select s_nationkey, count(*) from supplier where s_suppkey between 2211 and 2233 group by 1 order by 1;
select s_name, count(*) from supplier where s_suppkey between 30910 and 30915 group by 1 order by 1;
select  c_custkey, count(*) cnt  from  customer where  c_custkey in( 3332828, 1212822) group by 1 ;
select p_size, count(*)  from part where p_partkey between 445750 and 445752 group by 1 order by 1;
select * from orders where o_orderkey between  16725 and 16765 order by 1;
select s_address, count(*) from supplier where s_suppkey between 40111 and 40123 group by 1 order by 1;
select c_address, count(*) from customer where c_custkey between 19587 and 19587 group by 1 order by 1 ;
select * from orders where o_orderkey between  1322 and 1380 order by 1;
select  c_name, c_custkey  from  customer where  c_custkey in (9370, 5657, 915356) ;
select o_custkey, count(*) from orders where o_custkey = 16262633 group by 1;
select c_phone, count(*) from customer where c_custkey between 9837766 and 9837768 group by 1  order by 1 ;
select o_custkey, count(*) from orders where o_custkey = 885366 group by 1;
select * from    lineitem  where   l_orderkey = 83734 ;
select * From nation where n_name = 'MOROCCO' ;
select s_nationkey, count(*) from supplier where s_suppkey between 2211 and 2233 group by 1 order by 1;
select s_name, count(*) from supplier where s_suppkey between 66910 and 66915 group by 1 order by 1;
select  c_custkey, count(*) cnt  from  customer where  c_custkey in( 352828, 10030,20202,33332, 12822) group by 1 ;
select p_size, count(*)  from part where p_partkey between 985750 and 985752 group by 1 order by 1;
select l_orderkey, count(*) from    lineitem  where   l_orderkey = 223133 group by 1 ;
select count(*) From nation where n_nationkey between 10 and 30 ;
select * from orders where o_orderkey between  218393 and 218396 order by 1;
select p_name,count(*) from part where p_partkey between 83938 and 83940 group by 1 order by 1;
select l_orderkey, count(*) from    lineitem  where   l_orderkey = 39373 group by 1 ;
select * from customer where c_custkey between 484709 and 484711 order by 1 ;
select * From nation where n_name = 'USA' ;
select s_nationkey, count(*) from supplier where s_suppkey between 8940 and 8944 group by 1 order by 1;
select s_name, count(*) from supplier where s_suppkey between 18101 and 18111 group by 1 order by 1;
select  c_custkey, count(*) cnt  from  customer where  c_custkey in( 908097, 9022) group by 1 ;
select p_size, count(*)  from part where p_partkey between 12212 and 12223 group by 1 order by 1;
select * from orders where o_orderkey between  1121 and 1121 order by 1;
select s_address, count(*) from supplier where s_suppkey between 34353 and 34355 group by 1 order by 1;
select c_address, count(*) from customer where c_custkey between 9696 and 9699 group by 1 order by 1 ;
select * from orders where o_orderkey between  978978 and 978980 order by 1;
select  c_name, c_custkey  from  customer where  c_custkey in (970, 1057, 953536) ;
select o_custkey, count(*) from orders where o_custkey = 252353 group by 1;
select c_phone, count(*) from customer where c_custkey between 74754 and 74757 group by 1  order by 1 ;
select o_custkey, count(*) from orders where o_custkey = 3723724 group by 1;
select * from    lineitem  where   l_orderkey = 131531 ;
select  c_name, c_custkey  from  customer where  c_custkey = 13121 ;
select o_custkey, count(*) from orders where o_custkey = 123132 group by 1;
select * from orders where o_orderkey between  63768 and 63790 order by 1;
select c_comment, count(*) from customer where c_custkey between 745754 and 745760  group by 1 order by 1 ;
select c_name, count(*) from customer where c_custkey between 754257 and 754260 group by 1 order by 1 ;
select * from part where p_partkey = 97696  order by 1;
select * From nation where n_nationkey = 45 ;
select o_custkey, count(*) from orders where o_custkey = 745743 group by 1;
select * from orders where o_orderkey = 846865  order by 1;
select * From nation where n_name = 'JAPAN' ;
select o_custkey, count(*) from orders where o_custkey = 65896 group by 1;
select * from orders where o_orderkey = 57673  order by 1;
select o_custkey, count(*) from orders where o_custkey = 79765 group by 1;
select p_name, count(*) from part where p_partkey between 57845 and 57850 group by 1 order by 1;
select s_acctbal, count(*) from supplier where s_suppkey between 747352 and 747356 group by 1 order by 1;
select c_nationkey, count(*) from customer where c_custkey between 8368 and 8370 group by 1 order by 1 ;
select p_type, count(*) from part where p_partkey between 5733473 and 5733475 group by 1 order by 1;
select * from supplier where s_suppkey between 57457 and 57470 order by 1;
select  c_name, c_custkey  from  customer where  c_custkey = 35421 ;
select o_custkey, count(*) from orders where o_custkey = 243521    group by 1;
select * From nation where n_name = 'SWISS' ;
select * from    lineitem  where   l_orderkey = 35131 ;
select * from orders where o_orderkey between  4124 and 4126 order by 1;
select o_custkey, count(*) from orders where o_custkey = 1435214 group by 1;
select * From nation where n_name = 'DENMARK' ;
select p_partkey, count(*) from part where p_partkey between 75327 and 75330 group by 1 order by 1;
select c_acctbal, count(*) from customer where c_custkey between 643634 and 643638 group by 1  order by 1 ;
select * From nation where n_nationkey = 8 ;
select  c_name, count(*)  from  customer where  c_custkey = 97697  group by 1 order by 1;
select s_phone, count(*) from supplier where s_suppkey between 75472 and 75476 group by 1 order by 1;
select  c_name, c_custkey  from  customer where  c_custkey = 125125 ;
select s_acctbal, count(*) from supplier where s_suppkey between 68348 and 68360 group by 1 order by 1;
select * from orders where o_orderkey between  724572 and 724576 order by 1;
select * from    lineitem  where   l_orderkey = 2346 ;
select * from    lineitem  where   l_orderkey = 121311 order by 1 ;
select  c_custkey, count(*) cnt   from  customer where  c_custkey = 47373 group by 1 order by 1;
select * from orders where o_orderkey between  71373 and 71375 order by 1;
select count(*) from part where p_partkey between 317331 and 317335 order by 1;
select l_orderkey, count(*) from    lineitem  where   l_orderkey = 237327 group by 1 ;
select count(*) From nation where n_nationkey <= 8 ;
select * from orders where o_orderkey between  73247 and 73250 order by 1;
select p_name,count(*) from part where p_partkey between 834832 and 834832 group by 1 order by 1;
select l_orderkey, count(*) from    lineitem  where   l_orderkey = 72754 group by 1 ;
select * from customer where c_custkey between 84275 and 84280 order by 1 ;
select * From nation where n_name = 'MOROCCO' ;
select s_nationkey, count(*) from supplier where s_suppkey between 75436 and 75440 group by 1 order by 1;
select s_name, count(*) from supplier where s_suppkey between 732146 and 732146 group by 1 order by 1;
select  c_custkey, count(*) cnt  from  customer where  c_custkey in( 642352, 642355) group by 1 ;
select p_size, count(*)  from part where p_partkey between 725346 and 725350 group by 1 order by 1;
select * from orders where o_orderkey between  3253 and 3255 order by 1;
select s_address, count(*) from supplier where s_suppkey between 643543 and 643545 group by 1 order by 1;
select c_address, count(*) from customer where c_custkey between 265443 and 265446 group by 1 order by 1 ;
select * from orders where o_orderkey between  46353 and 46357 order by 1;
select  c_name, c_custkey  from  customer where  c_custkey in (34543, 3333, 123421) ;
select o_custkey, count(*) from orders where o_custkey = 13413 group by 1;
select c_phone, count(*) from customer where c_custkey between 435243 and 435245 group by 1  order by 1 ;
select o_custkey, count(*) from orders where o_custkey = 456345 group by 1;
select * from    lineitem  where   l_orderkey = 745764 ;
select * From nation where n_name = 'CHINA' ;
select s_nationkey, count(*) from supplier where s_suppkey between 8657 and 8660 group by 1 order by 1;
select s_name, count(*) from supplier where s_suppkey between 86575 and 86580 group by 1 order by 1;
select  c_custkey, count(*) cnt  from  customer where  c_custkey in( 56436, 45645,56456,456, 64654) group by 1 ;
select p_size, count(*)  from part where p_partkey between 46546 and 46550 group by 1 order by 1;