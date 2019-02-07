<<<<<<< HEAD
-- start query 1 in stream 0 using template query48.tpl and seed 622697896
select sum (ss_quantity)
 from store_sales, store, customer_demographics, customer_address, date_dim
 where s_store_sk = ss_store_sk
 and  ss_sold_date_sk = d_date_sk and d_year = 1998
 and  
 (
  (
   cd_demo_sk = ss_cdemo_sk
=======

select sum (ss_quantity)
 from store_sales, store, customer_demographics, customer_address, date_dim
 where store.s_store_sk = store_sales.ss_store_sk
 and  store_sales.ss_sold_date_sk = date_dim.d_date_sk and d_year = 1998
 and  
 (
  (
   customer_demographics.cd_demo_sk = store_sales.ss_cdemo_sk
>>>>>>> initial commit after forking
   and 
   cd_marital_status = 'M'
   and 
   cd_education_status = '4 yr Degree'
   and 
   ss_sales_price between 100.00 and 150.00  
   )
 or
  (
<<<<<<< HEAD
  cd_demo_sk = ss_cdemo_sk
=======
  customer_demographics.cd_demo_sk = store_sales.ss_cdemo_sk
>>>>>>> initial commit after forking
   and 
   cd_marital_status = 'M'
   and 
   cd_education_status = '4 yr Degree'
   and 
   ss_sales_price between 50.00 and 100.00   
  )
 or 
 (
<<<<<<< HEAD
  cd_demo_sk = ss_cdemo_sk
=======
  customer_demographics.cd_demo_sk = store_sales.ss_cdemo_sk
>>>>>>> initial commit after forking
  and 
   cd_marital_status = 'M'
   and 
   cd_education_status = '4 yr Degree'
   and 
   ss_sales_price between 150.00 and 200.00  
 )
 )
 and
 (
  (
<<<<<<< HEAD
  ss_addr_sk = ca_address_sk
=======
  store_sales.ss_addr_sk = customer_address.ca_address_sk
>>>>>>> initial commit after forking
  and
  ca_country = 'United States'
  and
  ca_state in ('KY', 'GA', 'NM')
  and ss_net_profit between 0 and 2000  
  )
 or
<<<<<<< HEAD
  (ss_addr_sk = ca_address_sk
=======
  (store_sales.ss_addr_sk = customer_address.ca_address_sk
>>>>>>> initial commit after forking
  and
  ca_country = 'United States'
  and
  ca_state in ('MT', 'OR', 'IN')
  and ss_net_profit between 150 and 3000 
  )
 or
<<<<<<< HEAD
  (ss_addr_sk = ca_address_sk
=======
  (store_sales.ss_addr_sk = customer_address.ca_address_sk
>>>>>>> initial commit after forking
  and
  ca_country = 'United States'
  and
  ca_state in ('WI', 'MO', 'WV')
  and ss_net_profit between 50 and 25000 
  )
 )
;

<<<<<<< HEAD
-- end query 1 in stream 0 using template query48.tpl
=======

>>>>>>> initial commit after forking
