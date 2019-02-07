<<<<<<< HEAD
-- start query 1 in stream 0 using template query95.tpl and seed 2031708268
with ws_wh as
(select ws1.ws_order_number,ws1.ws_warehouse_sk wh1,ws2.ws_warehouse_sk wh2
 from web_sales ws1,web_sales ws2
 where ws1.ws_order_number = ws2.ws_order_number
   and ws1.ws_warehouse_sk <> ws2.ws_warehouse_sk)
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
and ws1.ws_order_number in (select ws_order_number
                            from ws_wh)
and ws1.ws_order_number in (select wr_order_number
                            from web_returns,ws_wh
                            where wr_order_number = ws_wh.ws_order_number)
order by count(distinct ws_order_number)
limit 100;

-- end query 1 in stream 0 using template query95.tpl
=======
SELECT count(distinct ws1.ws_order_number) as order_count,
               sum(ws1.ws_ext_ship_cost) as total_shipping_cost,
               sum(ws1.ws_net_profit) as total_net_profit
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
LEFT SEMI JOIN (SELECT wr_order_number
                               FROM web_returns wr
                               JOIN (SELECT ws4.ws_order_number as ws_order_number
                                          FROM web_sales ws4 JOIN web_sales ws5
                                          ON (ws4.ws_order_number = ws5.ws_order_number)
                                         WHERE ws4.ws_warehouse_sk <> ws5.ws_warehouse_sk
				) ws_wh2
                               ON (wr.wr_order_number = ws_wh2.ws_order_number)) tmp1
ON (ws1.ws_order_number = tmp1.wr_order_number)
WHERE d.d_date between '2002-05-01' and '2002-06-30' and
               ca.ca_state = 'GA' and
               s.web_company_name = 'pri';
>>>>>>> initial commit after forking
