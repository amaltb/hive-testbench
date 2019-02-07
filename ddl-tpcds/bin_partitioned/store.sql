create database if not exists ${DB};
use ${DB};

drop table if exists store;

create table store
stored as ${FILE}
<<<<<<< HEAD
as select * from ${SOURCE}.store
CLUSTER BY s_store_sk
;
=======
as select * from ${SOURCE}.store;
>>>>>>> initial commit after forking
