<<<<<<< HEAD
-- start query 1 in stream 0 using template query27.tpl and seed 2017787633
select  i_item_id,
        s_state, grouping(s_state) g_state,
=======
select  i_item_id,
        s_state,
>>>>>>> initial commit after forking
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
<<<<<<< HEAD
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'M' and
       cd_marital_status = 'U' and
       cd_education_status = '2 yr Degree' and
       d_year = 2001 and
       s_state in ('SD','FL', 'MI', 'LA', 'MO', 'SC')
 group by rollup (i_item_id, s_state)
=======
 where store_sales.ss_sold_date_sk = date_dim.d_date_sk and
       store_sales.ss_item_sk = item.i_item_sk and
       store_sales.ss_store_sk = store.s_store_sk and
       store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk and
       customer_demographics.cd_gender = 'F' and
       customer_demographics.cd_marital_status = 'D' and
       customer_demographics.cd_education_status = 'Unknown' and
       date_dim.d_year = 1998 and
       store.s_state in ('KS','AL', 'MN', 'AL', 'SC', 'VT')
 group by i_item_id, s_state
>>>>>>> initial commit after forking
 order by i_item_id
         ,s_state
 limit 100;

<<<<<<< HEAD
-- end query 1 in stream 0 using template query27.tpl
=======

>>>>>>> initial commit after forking
