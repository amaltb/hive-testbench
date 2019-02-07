<<<<<<< HEAD
-- start query 1 in stream 0 using template query40.tpl and seed 1819994127
=======
>>>>>>> initial commit after forking
select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('1998-04-08' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('1998-04-08' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
<<<<<<< HEAD
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
=======
       (catalog_sales.cs_order_number = catalog_returns.cr_order_number 
        and catalog_sales.cs_item_sk = catalog_returns.cr_item_sk)
>>>>>>> initial commit after forking
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
<<<<<<< HEAD
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('1998-04-08' as date) - 30 days)
                and (cast ('1998-04-08' as date) + 30 days) 
=======
 and item.i_item_sk          = catalog_sales.cs_item_sk
 and catalog_sales.cs_warehouse_sk    = warehouse.w_warehouse_sk 
 and catalog_sales.cs_sold_date_sk    = date_dim.d_date_sk
 and date_dim.d_date between '1998-03-09' and '1998-05-08'
>>>>>>> initial commit after forking
 group by
    w_state,i_item_id
 order by w_state,i_item_id
limit 100;

<<<<<<< HEAD
-- end query 1 in stream 0 using template query40.tpl
=======

>>>>>>> initial commit after forking
