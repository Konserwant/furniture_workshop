create table materials(id_plate int primary key,
a int, 
b int,
material varchar2(20));
create sequence materials_seq;
commit;

create table clients(id_client int primary key, 
first_name varchar2(20), 
surname varchar2(20));
create sequence clients_seq;

commit;

create table orders(
id_order int primary key, 
id_client int,
a int, 
b int,
id_plate int
);

create sequence orders_seq;
alter table orders add constraint platefk foreign key(id_plate) references materials(id_plate);
alter table orders add constraint clientfk foreign key(id_client) references clients(id_client);
alter table orders add status varchar2(20);
alter table materials add price_m2 number;
alter table orders add price number;
commit;
