<<<<<<< HEAD
-- start query 1 in stream 0 using template query22.tpl and seed 1819994127
=======
>>>>>>> initial commit after forking
select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
           ,warehouse
<<<<<<< HEAD
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and inv_warehouse_sk = w_warehouse_sk
              and d_month_seq between 1212 and 1212 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
limit 100;

-- end query 1 in stream 0 using template query22.tpl
=======
       where inventory.inv_date_sk=date_dim.d_date_sk
              and inventory.inv_item_sk=item.i_item_sk
              and inventory.inv_warehouse_sk = warehouse.w_warehouse_sk
              and date_dim.d_month_seq between 1193 and 1193 + 11
       group by i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category with rollup
order by qoh, i_product_name, i_brand, i_class, i_category
limit 100;
>>>>>>> initial commit after forking
