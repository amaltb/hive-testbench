<<<<<<< HEAD
-- start query 1 in stream 0 using template query84.tpl and seed 1819994127
select  c_customer_id as customer_id
       ,c_last_name || ', ' || c_first_name as customername
=======

select  c_customer_id as customer_id
       ,concat(c_last_name, ', ', c_first_name) as customername
>>>>>>> initial commit after forking
 from customer
     ,customer_address
     ,customer_demographics
     ,household_demographics
     ,income_band
     ,store_returns
 where ca_city	        =  'Hopewell'
<<<<<<< HEAD
   and c_current_addr_sk = ca_address_sk
   and ib_lower_bound   >=  32287
   and ib_upper_bound   <=  32287 + 50000
   and ib_income_band_sk = hd_income_band_sk
   and cd_demo_sk = c_current_cdemo_sk
   and hd_demo_sk = c_current_hdemo_sk
   and sr_cdemo_sk = cd_demo_sk
 order by c_customer_id
 limit 100;

-- end query 1 in stream 0 using template query84.tpl
=======
   and customer.c_current_addr_sk = customer_address.ca_address_sk
   and ib_lower_bound   >=  32287
   and ib_upper_bound   <=  32287 + 50000
   and income_band.ib_income_band_sk = household_demographics.hd_income_band_sk
   and customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk
   and household_demographics.hd_demo_sk = customer.c_current_hdemo_sk
   and store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk
 order by customer_id
 limit 100;


>>>>>>> initial commit after forking
