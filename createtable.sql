create table "customer" (
	customer_id serial primary key,
	name varchar(100),
	email varchar(320) unique not null,
	address varchar(100) not null
);

create table "user" (
	user_id serial primary key,
	password varchar(100) not null,
	customer_id int not null references customer
);

create table "guest" (
	quest_id serial primary key,
	customer_id int not null references customer
);

create table "product" (
	product_id serial primary key,
	sku varchar(11) not null,
	product_name varchar(100) not null,
	units_in_stock numeric not null,
	description text,
	category text,
	price numeric(10,2)
);

create table "order" (
	order_id serial primary key,
	order_no int not null,
	payment varchar(50) not null,
	quantity numeric not null,
	order_date date not null,
	total numeric(10,2) not null,
	customer_id int not null references customer,
	product_id int not null references product
);
