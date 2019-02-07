<<<<<<< HEAD
-- start query 1 in stream 0 using template query96.tpl and seed 1819994127
select  count(*) 
from store_sales
    ,household_demographics 
    ,time_dim, store
where ss_sold_time_sk = time_dim.t_time_sk   
    and ss_hdemo_sk = household_demographics.hd_demo_sk 
    and ss_store_sk = s_store_sk
=======

select  count(*) as c
from store_sales
    ,household_demographics 
    ,time_dim, store
where store_sales.ss_sold_time_sk = time_dim.t_time_sk   
    and store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk 
    and store_sales.ss_store_sk = store.s_store_sk
>>>>>>> initial commit after forking
    and time_dim.t_hour = 8
    and time_dim.t_minute >= 30
    and household_demographics.hd_dep_count = 5
    and store.s_store_name = 'ese'
<<<<<<< HEAD
order by count(*)
limit 100;

-- end query 1 in stream 0 using template query96.tpl
=======
order by c
limit 100;


>>>>>>> initial commit after forking
