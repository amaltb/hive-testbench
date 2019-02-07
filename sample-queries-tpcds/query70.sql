<<<<<<< HEAD
-- start query 1 in stream 0 using template query70.tpl and seed 1819994127
=======
>>>>>>> initial commit after forking
select  
    sum(ss_net_profit) as total_sum
   ,s_state
   ,s_county
<<<<<<< HEAD
   ,grouping(s_state)+grouping(s_county) as lochierarchy
   ,rank() over (
 	partition by grouping(s_state)+grouping(s_county),
 	case when grouping(s_county) = 0 then s_state end 
 	order by sum(ss_net_profit) desc) as rank_within_parent
 from
    store_sales
   ,date_dim       d1
   ,store
 where
    d1.d_month_seq between 1212 and 1212+11
 and d1.d_date_sk = ss_sold_date_sk
 and s_store_sk  = ss_store_sk
 and s_state in
             ( select s_state
               from  (select s_state as s_state,
 			    rank() over ( partition by s_state order by sum(ss_net_profit) desc) as ranking
                      from   store_sales, store, date_dim
                      where  d_month_seq between 1212 and 1212+11
 			    and d_date_sk = ss_sold_date_sk
 			    and s_store_sk  = ss_store_sk
=======
   ,grouping__id as lochierarchy
   , rank() over(partition by grouping__id, case when grouping__id == 2 then s_state end order by sum(ss_net_profit)) as rank_within_parent
from
    store_sales ss join date_dim d1 on d1.d_date_sk = ss.ss_sold_date_sk
    join store s on s.s_store_sk  = ss.ss_store_sk
 where
    d1.d_month_seq between 1193 and 1193+11
 and s.s_state in
             ( select s_state
               from  (select s_state as s_state, sum(ss_net_profit),
                             rank() over ( partition by s_state order by sum(ss_net_profit) desc) as ranking
                      from   store_sales, store, date_dim
                      where  d_month_seq between 1193 and 1193+11
                            and date_dim.d_date_sk = store_sales.ss_sold_date_sk
                            and store.s_store_sk  = store_sales.ss_store_sk
>>>>>>> initial commit after forking
                      group by s_state
                     ) tmp1 
               where ranking <= 5
             )
<<<<<<< HEAD
 group by rollup(s_state,s_county)
 order by
=======
 group by s_state,s_county with rollup
order by
>>>>>>> initial commit after forking
   lochierarchy desc
  ,case when lochierarchy = 0 then s_state end
  ,rank_within_parent
 limit 100;
<<<<<<< HEAD

-- end query 1 in stream 0 using template query70.tpl
=======
>>>>>>> initial commit after forking
