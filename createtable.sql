drop table "customer";
drop table "user";
drop table "guests";
drop table "product";
drop table "order_product";


create table "customer" (
	customer_id serial primary key,
	name varchar(100),
	email varchar(320) unique not null,
	password varchar(100) not null,
	address varchar(100) not null,
	phone varchar(15)
);

create table "user" (
	user_id serial primary key,
	password varchar(100) not null,
	customer_id integer not null references customer
);

create table "guest" (
	quest_id serial primary key,
	customer_id integer not null references customer
);

create table "product" (
	product_id serial primary key,
	sku varchar(11) not null,
	product_name varchar(100) not null,
	price numeric(10,2) not null,
	units_in_stock integer default 0,
	description text,
	category text
);

create table "order_product" (
	order_id serial primary key,
	order_no integer not null,
	quantity integer not null,	
	total numeric(10,2) not null,
	customer_id integer not null references customer,
	product_id integer not null references products,
	order_date timestamp with time zone not null
);

