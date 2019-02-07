<<<<<<< HEAD
-- start query 1 in stream 0 using template query94.tpl and seed 2031708268
select  
   count(distinct ws_order_number) as `order count`
  ,sum(ws_ext_ship_cost) as `total shipping cost`
  ,sum(ws_net_profit) as `total net profit`
from
   web_sales ws1
  ,date_dim
  ,customer_address
  ,web_site
where
    d_date between '1999-5-01' and 
           (cast('1999-5-01' as date) + 60 days)
and ws1.ws_ship_date_sk = d_date_sk
and ws1.ws_ship_addr_sk = ca_address_sk
and ca_state = 'TX'
and ws1.ws_web_site_sk = web_site_sk
and web_company_name = 'pri'
and exists (select *
            from web_sales ws2
            where ws1.ws_order_number = ws2.ws_order_number
              and ws1.ws_warehouse_sk <> ws2.ws_warehouse_sk)
and not exists(select *
               from web_returns wr1
               where ws1.ws_order_number = wr1.wr_order_number)
order by count(distinct ws_order_number)
limit 100;

-- end query 1 in stream 0 using template query94.tpl
=======
SELECT count(distinct ws_order_number) as order_count,
               sum(ws_ext_ship_cost) as total_shipping_cost,
               sum(ws_net_profit) as total_net_profit
FROM web_sales ws1
JOIN customer_address ca ON (ws1.ws_ship_addr_sk = ca.ca_address_sk)
JOIN web_site s ON (ws1.ws_web_site_sk = s.web_site_sk)
JOIN date_dim d ON (ws1.ws_ship_date_sk = d.d_date_sk)
LEFT SEMI JOIN (SELECT ws2.ws_order_number as ws_order_number
                               FROM web_sales ws2 JOIN web_sales ws3
                               ON (ws2.ws_order_number = ws3.ws_order_number)
                               WHERE ws2.ws_warehouse_sk <> ws3.ws_warehouse_sk
			) ws_wh1
ON (ws1.ws_order_number = ws_wh1.ws_order_number)
LEFT OUTER JOIN web_returns wr1 ON (ws1.ws_order_number = wr1.wr_order_number)
WHERE d.d_date between '1999-05-01' and '1999-07-01' and
               ca.ca_state = 'TX' and
               s.web_company_name = 'pri' and
               wr1.wr_order_number is null
limit 100;
>>>>>>> initial commit after forking
