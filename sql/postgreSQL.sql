create table delivery (
	id serial not null constraint PK_id primary key,
	name varchar not null,
	phone varchar(11) not null constraint CH_phone check (phone similar to '+9[0-9]{9}') constraint UQ_phone Unique,
	zip varchar(6) not null constraint CH_zip check (zip similar to '[0-9]{6}'),
	city varchar not null,
	address varchar not null,
	region varchar not null,
	email varchar not null constraint CH_email check (email like '%@%.%')
)

create table payment (
	transaction serial not null,
	request_id varchar,
	currency varchar,
	provider varchar,
	amount integer,
	payment_dt integer,
	bank varchar,
	delivery_cost integer,
	goods_total integer,
	custom_fee integer,
);

create table items (
	chrt_id serial not null,
	track_number varchar,
	price integer,
	rid varchar,
	name varchar,
	sale integer,
	size varchar,
	total_price integer,
	nm_id integer,
	brand varchar,
	status integer,
);