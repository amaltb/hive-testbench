create database if not exists ${DB};
use ${DB};

drop table if exists item;

create table item
stored as ${FILE}
<<<<<<< HEAD
as select * from ${SOURCE}.item
CLUSTER BY i_item_sk
;
=======
as select * from ${SOURCE}.item;
>>>>>>> initial commit after forking
