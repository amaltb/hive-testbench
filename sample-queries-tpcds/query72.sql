<<<<<<< HEAD
-- start query 1 in stream 0 using template query72.tpl and seed 2031708268
=======

>>>>>>> initial commit after forking
select  i_item_desc
      ,w_warehouse_name
      ,d1.d_week_seq
      ,count(case when p_promo_sk is null then 1 else 0 end) no_promo
      ,count(case when p_promo_sk is not null then 1 else 0 end) promo
      ,count(*) total_cnt
from catalog_sales
<<<<<<< HEAD
join inventory on (cs_item_sk = inv_item_sk)
join warehouse on (w_warehouse_sk=inv_warehouse_sk)
join item on (i_item_sk = cs_item_sk)
join customer_demographics on (cs_bill_cdemo_sk = cd_demo_sk)
join household_demographics on (cs_bill_hdemo_sk = hd_demo_sk)
join date_dim d1 on (cs_sold_date_sk = d1.d_date_sk)
join date_dim d2 on (inv_date_sk = d2.d_date_sk)
join date_dim d3 on (cs_ship_date_sk = d3.d_date_sk)
left outer join promotion on (cs_promo_sk=p_promo_sk)
left outer join catalog_returns on (cr_item_sk = cs_item_sk and cr_order_number = cs_order_number)
=======
join inventory on (catalog_sales.cs_item_sk = inventory.inv_item_sk)
join warehouse on (warehouse.w_warehouse_sk=inventory.inv_warehouse_sk)
join item on (item.i_item_sk = catalog_sales.cs_item_sk)
join customer_demographics on (catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk)
join household_demographics on (catalog_sales.cs_bill_hdemo_sk = household_demographics.hd_demo_sk)
join date_dim d1 on (catalog_sales.cs_sold_date_sk = d1.d_date_sk)
join date_dim d2 on (inventory.inv_date_sk = d2.d_date_sk)
join date_dim d3 on (catalog_sales.cs_ship_date_sk = d3.d_date_sk)
left outer join promotion on (catalog_sales.cs_promo_sk=promotion.p_promo_sk)
left outer join catalog_returns on (catalog_returns.cr_item_sk = catalog_sales.cs_item_sk and catalog_returns.cr_order_number = catalog_sales.cs_order_number)
>>>>>>> initial commit after forking
where d1.d_week_seq = d2.d_week_seq
  and inv_quantity_on_hand < cs_quantity 
  and d3.d_date > d1.d_date + 5
  and hd_buy_potential = '1001-5000'
  and d1.d_year = 2001
  and hd_buy_potential = '1001-5000'
  and cd_marital_status = 'M'
  and d1.d_year = 2001
group by i_item_desc,w_warehouse_name,d1.d_week_seq
order by total_cnt desc, i_item_desc, w_warehouse_name, d_week_seq
limit 100;

<<<<<<< HEAD
-- end query 1 in stream 0 using template query72.tpl
=======

>>>>>>> initial commit after forking
