create database if not exists ${DB};
use ${DB};

drop table if exists customer;

create table customer
stored as ${FILE}
<<<<<<< HEAD
as select * from ${SOURCE}.customer
CLUSTER BY c_customer_sk
;
=======
as select * from ${SOURCE}.customer;
>>>>>>> initial commit after forking
