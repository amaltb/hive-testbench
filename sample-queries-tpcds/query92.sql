<<<<<<< HEAD
-- start query 1 in stream 0 using template query92.tpl and seed 2031708268
select  
   sum(ws_ext_discount_amt)  as `Excess Discount Amount` 
from 
    web_sales 
   ,item 
   ,date_dim
where
i_manufact_id = 269
and i_item_sk = ws_item_sk 
and d_date between '1998-03-18' and 
        (cast('1998-03-18' as date) + 90 days)
and d_date_sk = ws_sold_date_sk 
and ws_ext_discount_amt  
     > ( 
         SELECT 
            1.3 * avg(ws_ext_discount_amt) 
         FROM 
            web_sales 
           ,date_dim
         WHERE 
              ws_item_sk = i_item_sk 
          and d_date between '1998-03-18' and
                             (cast('1998-03-18' as date) + 90 days)
          and d_date_sk = ws_sold_date_sk 
      ) 
order by sum(ws_ext_discount_amt)
limit 100;

-- end query 1 in stream 0 using template query92.tpl
=======
SELECT sum(case when ssci.customer_sk is not null and csci.customer_sk is null then 1
                                 else 0 end) as store_only,
               sum(case when ssci.customer_sk is null and csci.customer_sk is not null then 1
                                else 0 end) as catalog_only,
               sum(case when ssci.customer_sk is not null and csci.customer_sk is not null then 1 
                                 else 0 end) as store_and_catalog
FROM (SELECT ss.ss_customer_sk as customer_sk,
                             ss.ss_item_sk as item_sk
             FROM store_sales ss
             JOIN date_dim d1 ON (ss.ss_sold_date_sk = d1.d_date_sk)
             WHERE d1.d_month_seq >= 1206 and
                            d1.d_month_seq <= 1217
             GROUP BY ss.ss_customer_sk, ss.ss_item_sk) ssci
FULL OUTER JOIN (SELECT cs.cs_bill_customer_sk as customer_sk,
                                                   cs.cs_item_sk as item_sk
                                   FROM catalog_sales cs
                                   JOIN date_dim d2 ON (cs.cs_sold_date_sk = d2.d_date_sk)
                                   WHERE d2.d_month_seq >= 1206 and
                                                  d2.d_month_seq <= 1217
                                   GROUP BY cs.cs_bill_customer_sk, cs.cs_item_sk) csci
ON (ssci.customer_sk=csci.customer_sk and
        ssci.item_sk = csci.item_sk);
>>>>>>> initial commit after forking
