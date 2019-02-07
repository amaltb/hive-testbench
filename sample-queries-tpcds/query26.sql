<<<<<<< HEAD
-- start query 1 in stream 0 using template query26.tpl and seed 1930872976
=======
>>>>>>> initial commit after forking
select  i_item_id, 
        avg(cs_quantity) agg1,
        avg(cs_list_price) agg2,
        avg(cs_coupon_amt) agg3,
        avg(cs_sales_price) agg4 
 from catalog_sales, customer_demographics, date_dim, item, promotion
<<<<<<< HEAD
 where cs_sold_date_sk = d_date_sk and
       cs_item_sk = i_item_sk and
       cs_bill_cdemo_sk = cd_demo_sk and
       cs_promo_sk = p_promo_sk and
=======
 where catalog_sales.cs_sold_date_sk = date_dim.d_date_sk and
       catalog_sales.cs_item_sk = item.i_item_sk and
       catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk and
       catalog_sales.cs_promo_sk = promotion.p_promo_sk and
>>>>>>> initial commit after forking
       cd_gender = 'F' and 
       cd_marital_status = 'W' and
       cd_education_status = 'Primary' and
       (p_channel_email = 'N' or p_channel_event = 'N') and
<<<<<<< HEAD
       d_year = 1998 
 group by i_item_id
 order by i_item_id
 limit 100;

-- end query 1 in stream 0 using template query26.tpl
=======
       d_year = 1998
 group by i_item_id
 order by i_item_id
 limit 100;
>>>>>>> initial commit after forking
