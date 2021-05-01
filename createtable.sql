drop table "customer";
drop table "login";
drop table "product";
drop table "order_product";


create table "customer" (
	customer_id serial primary key,
	name varchar(100) not null,
	email varchar(320) unique not null,
	address varchar(100) not null,
	phone varchar(15)
);

create table "login" (
	login_id serial primary key,
	hash varchar(100) not null,
	email varchar(320) unique not null references customer(email)
);

create table "product" (
	product_id serial primary key,
	product_name varchar(100) not null,
	price numeric(10,2) not null,
	units_in_stock integer default 0,
	description text
);

create table "order_product" (
	order_id serial primary key,
	order_no integer not null,
	quantity integer not null,	
	total numeric(10,2) not null,
	order_date date not null,
	customer_id integer not null references customer,
	product_id integer not null references product	
);


insert into customer (name, email, address) values ('Joe','joe@example.com', '111 example st');
insert into login(hash, email) values ('password', 'joe@example.com');
insert into product (product_name, price, units_in_stock, description) values ('Khaki Pants', 39, 100),
('Floral Dress', 25, 100),('Polo Shirt', 27.50, 100),('Winter Gloves', 15, 100),('Jeans', 49, 100);
insert into order_product (order_no, quantity, total, order_date, customer_id, product_id) values (1, 1, 26, now(), 1, 1);

