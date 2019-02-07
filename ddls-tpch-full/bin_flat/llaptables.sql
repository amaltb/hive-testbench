create database if not exists llap;

drop table if exists llap.customer;
create table llap.customer
stored as orc
as select * from tpch_text_2.customer;

drop table if exists llap.lineitem;
create table llap.lineitem
stored as orc
as select * from tpch_text_2.lineitem;

drop table if exists llap.nation;
create table llap.nation
stored as orc
as select * from tpch_text_2.nation;

drop table if exists llap.orders;
create table llap.orders
stored as orc
as select * from tpch_text_2.orders;

drop table if exists llap.part;
create table llap.part
stored as orc
as select * from tpch_text_2.part;

drop table if exists llap.partsupp;
create table llap.partsupp
stored as orc
as select * from tpch_text_2.partsupp;

drop table if exists llap.region;
create table llap.region
stored as orc
as select * from tpch_text_2.region;

drop table if exists llap.supplier;
create table llap.supplier
stored as orc
as select * from tpch_text_2.supplier;

analyze table llap.customer compute statistics for columns;
analyze table llap.lineitem compute statistics for columns;
analyze table llap.nation compute statistics for columns;
analyze table llap.orders compute statistics for columns;
analyze table llap.part compute statistics for columns;
analyze table llap.partsupp compute statistics for columns;
analyze table llap.region compute statistics for columns;
analyze table llap.supplier compute statistics for columns;
