drop table if exists public.mart_catalog_sales;
create table public.mart_catalog_sales
with (appendonly=true, compresslevel=5, compresstype=zstd)
as
select
  array_agg(cs_sold_date_sk          ) cs_sold_date_sk      
, array_agg(cs_sold_time_sk          ) cs_sold_time_sk      
, array_agg(cs_ship_date_sk          ) cs_ship_date_sk      
, array_agg(cs_bill_customer_sk      ) cs_bill_customer_sk  
, array_agg(cs_bill_cdemo_sk         ) cs_bill_cdemo_sk     
, array_agg(cs_bill_hdemo_sk         ) cs_bill_hdemo_sk     
, array_agg(cs_bill_addr_sk          ) cs_bill_addr_sk      
, cs_ship_customer_sk                  
, array_agg(cs_ship_cdemo_sk         ) cs_ship_cdemo_sk     
, array_agg(cs_ship_hdemo_sk         ) cs_ship_hdemo_sk     
, array_agg(cs_ship_addr_sk          ) cs_ship_addr_sk      
, array_agg(cs_call_center_sk        ) cs_call_center_sk    
, array_agg(cs_catalog_page_sk       ) cs_catalog_page_sk   
, array_agg(cs_ship_mode_sk          ) cs_ship_mode_sk      
, array_agg(cs_warehouse_sk          ) cs_warehouse_sk      
, cs_item_sk                           
, array_agg(cs_promo_sk              ) cs_promo_sk          
, array_agg(cs_order_number          ) cs_order_number      
, array_agg(cs_quantity              ) cs_quantity          
, array_agg(cs_wholesale_cost        ) cs_wholesale_cost    
, array_agg(cs_list_price            ) cs_list_price        
, array_agg(cs_sales_price           ) cs_sales_price       
, array_agg(cs_ext_discount_amt      ) cs_ext_discount_amt  
, array_agg(cs_ext_sales_price       ) cs_ext_sales_price   
, array_agg(cs_ext_wholesale_cost    ) cs_ext_wholesale_cost
, array_agg(cs_ext_list_price        ) cs_ext_list_price    
, array_agg(cs_ext_tax               ) cs_ext_tax           
, array_agg(cs_coupon_amt            ) cs_coupon_amt        
, array_agg(cs_ext_ship_cost         ) cs_ext_ship_cost     
, array_agg(cs_net_paid              ) cs_net_paid          
, array_agg(cs_net_paid_inc_tax      ) cs_net_paid_inc_tax  
, array_agg(cs_net_paid_inc_ship     ) cs_net_paid_inc_ship 
, array_agg(cs_net_paid_inc_ship_tax ) cs_net_paid_inc_ship_tax
, array_agg(cs_net_profit       )      cs_net_profit  
from
        tpcds.catalog_sales
where
        cs_sold_date_sk between 2450815 and 2451038
group by
        cs_item_sk, cs_ship_customer_sk
distributed by (cs_item_sk,cs_ship_customer_sk);

