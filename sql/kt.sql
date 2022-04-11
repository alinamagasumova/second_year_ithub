create database it_firm;
use it_firm;
# show databases;
# select TABLE_SCHEMA, count(TABLE_NAME) from information_schema.tables where TABLE_NAME like "employee%" group by TABLE_SCHEMA;
# select TABLE_SCHEMA, TABLE_NAME, AUTO_INCREMENT, TABLE_TYPE from information_schema.tables where TABLE_NAME like "employee%" and TABLE_TYPE = "VIEW";

create table sotrudnik
(
    id_sotrudnik int not null auto_increment primary key,
	sur_sotrudnik varchar(50) not null,
	name_sotrudnik varchar(50) not null,
	otch_sotrudnik varchar(50) null default '-',
	phone_sotrudnik varchar(11) not null check (regexp_like(phone_sotrudnik, '8[0-9]{10}')) unique,
	mail_sotrudnik varchar(25) null default '@.' check (regexp_like(mail_sotrudnik, '(.*)@(.*)\.(.*)')) unique,
	S_P_sotrudnik varchar(4) not null check (regexp_like(S_P_sotrudnik, '[0-9]{4}')),
	N_P_sotrudnik varchar(6) not null check (regexp_like(N_P_sotrudnik, '[0-9]{6}')),
	birth_date_sotrudnik date not null,
	dolznost_ID int not null references dolznost (id_dolznost)
);
alter table sotrudnik add check (regexp_like(mail_sotrudnik, '(.*)@(.*)\.(.*)'));

DELIMITER //
create procedure sotrudnik_update (in p_id_sotrudnik int, in p_sur_sotrudnik varchar(50), in p_name_sotrudnik varchar(50), in p_otch_sotrudnik varchar(50), in p_phone_sotrudnik varchar(11), in p_mail_sotrudnik varchar(25), in p_S_P_sotrudnik varchar(4), in p_N_P_sotrudnik varchar(6), in p_birth_date_sotrudnik date, in p_dolznost_ID int)
begin
 update sotrudnik set
 sur_sotrudnik = p_sur_sotrudnik,
 name_sotrudnik = p_name_sotrudnik,
 otch_sotrudnik = p_otch_sotrudnik,
 phone_sotrudnik = p_phone_sotrudnik,
 mail_sotrudnik = p_mail_sotrudnik,
 S_P_sotrudnik = p_S_P_sotrudnik,
 N_P_sotrudnik = p_N_P_sotrudnik,
 birth_date_sotrudnik = p_birth_date_sotrudnik,
 dolznost_ID = p_dolznost_ID
 where
  id_sotrudnik = p_id_sotrudnik;
end; //

DELIMITER //
create procedure sotrudnik_insert (in p_sur_sotrudnik varchar(50), in p_name_sotrudnik varchar(50), in p_otch_sotrudnik varchar(50), in p_phone_sotrudnik varchar(11), in p_mail_sotrudnik varchar(25), in p_S_P_sotrudnik varchar(4), in p_N_P_sotrudnik varchar(6), in p_birth_date_sotrudnik date, in p_dolznost_ID int)
begin
 insert into sotrudnik(sur_sotrudnik, name_sotrudnik, otch_sotrudnik, phone_sotrudnik, mail_sotrudnik, S_P_sotrudnik, N_P_sotrudnik, birth_date_sotrudnik, dolznost_ID)
 values(p_sur_sotrudnik, p_name_sotrudnik, p_otch_sotrudnik, p_phone_sotrudnik, p_mail_sotrudnik , p_S_P_sotrudnik, p_N_P_sotrudnik, p_birth_date_sotrudnik, p_dolznost_ID);
end; //

DELIMITER //
create procedure sotrudnik_delete (in p_id_sotrudnik int)
begin
 delete from sotrudnik
 where id_sotrudnik = p_id_sotrudnik;
end; //

create table history_sotrudnik
(
	id_history_sotrudnik int not null auto_increment primary key,
    record_status varchar (30) not null,
    sotrudnik_info varchar (30) not null,
    dolznost_info varchar (30) not null,
    date_create timestamp null default now()
);

DELIMITER //
create trigger tg_sotrudnik_insert
after insert on sotrudnik
for each row
begin
	if NEW.id_sotrudnik then
		insert into history_sotrudnik (record_status, sotrudnik_info, dolznost_info)
        values ('Новая запись', (select concat('Имя: ', sur_sotrudnik,' ',substr(name_sotrudnik from 1 for 1),'.',substr(otch_sotrudnik from 1 for 1),'.')
        from sotrudnik where id_sotrudnik = NEW.id_sotrudnik),
        (select concat('Должность: ', nazv_dolznost)
        from dolznost where id_dolznost = NEW.dolznost_ID));
    end if;
end //

call sotrudnik_insert('Alina', 'Magasumova', 'Ramilevna', '89851383377', 'm@m.r', '6715', '678543', '2002-08-23', 3);

DELIMITER //
create trigger tg_sotrudnik_update
after update on sotrudnik
for each row
begin
	if NEW.id_sotrudnik then
		insert into history_sotrudnik (record_status, sotrudnik_info, dolznost_info)
        values ('Запись изменена',
        (select concat('Имя: ', sur_sotrudnik,' ',substr(name_sotrudnik from 1 for 1),'.',substr(otch_sotrudnik from 1 for 1),'.')
        from sotrudnik where id_sotrudnik = NEW.id_sotrudnik),
        (select concat('Должность: ', nazv_dolznost)
        from dolznost where id_dolznost = NEW.dolznost_ID));
    end if;
end //

DELIMITER //
create trigger tg_sotrudnik_delete
before delete on sotrudnik
for each row
begin
	if OLD.id_sotrudnik then
		insert into history_sotrudnik (record_status, sotrudnik_info, dolznost_info)
        values ('Запись удалена',
        (select concat('Имя: ', sur_sotrudnik,' ',substr(name_sotrudnik from 1 for 1),'.',substr(otch_sotrudnik from 1 for 1),'.')
        from sotrudnik where id_sotrudnik = OLD.id_sotrudnik),
        (select concat('Должность: ', nazv_dolznost)
        from dolznost where id_dolznost = OLD.dolznost_ID));
    end if;
end //

create table dolznost
(
    id_dolznost int not null auto_increment primary key,
    nazv_dolznost varchar(50) not null unique
);

DELIMITER //
create procedure dolznost_update (in p_id_dolznost int, in p_nazv_dolznost varchar(50))
begin
 update dolznost set
 nazv_dolznost = p_nazv_dolznost
 where
  id_dolznost = p_id_dolznost;
end; //

DELIMITER //
create procedure dolznost_insert (in p_nazv_dolznost varchar(50))
begin
 insert into dolznost(nazv_dolznost)
 values(p_nazv_dolznost);
end; //

DELIMITER //
create procedure dolznost_delete (in p_id_dolznost int)
begin
 delete from dolznost
 where id_dolznost = p_id_dolznost;
end; //

call dolznost_insert('Директор');

create table type_file
(
	id_type_file int not null auto_increment primary key,
	type_file varchar(15) not null unique
);

DELIMITER //
create procedure type_file_update (in p_id_type_file int, in p_type_file varchar(15))
begin
 update type_file set
 type_file = p_type_file
 where
  id_type_file = p_id_type_file;
end; //

DELIMITER //
create procedure type_file_insert (in p_type_file varchar(50))
begin
 insert into type_file(type_file)
 values(p_type_file);
end; //

DELIMITER //
create procedure type_file_delete (in p_id_type_file int)
begin
 delete from type_file
 where id_type_file = p_id_type_file;
end; //

create table ext_file
(
	id_ext_file int not null auto_increment primary key,
	ext_file varchar(5) not null unique
);

DELIMITER //
create procedure ext_file_update (in p_id_ext_file int, in p_ext_file varchar(5))
begin
 update ext_file set
 ext_file = p_ext_file
 where
  id_ext_file = p_id_ext_file;
end; //

DELIMITER //
create procedure ext_file_insert (in p_ext_file varchar(5))
begin
 insert into ext_file(ext_file)
 values(p_ext_file);
end; //

DELIMITER //
create procedure ext_file_delete (in p_id_ext_file int)
begin
 delete from ext_file
 where id_ext_file = p_id_ext_file;
end; //

create table treb_prog
(
	id_treb_prog int not null auto_increment primary key,
	treb_prog varchar(20) not null unique
);

DELIMITER //
create procedure treb_prog_update (in p_id_treb_prog int, in p_treb_prog varchar(20))
begin
 update treb_prog set
 treb_prog = p_treb_prog
 where
  id_treb_prog = p_id_treb_prog;
end; //

DELIMITER //
create procedure treb_prog_insert (in p_treb_prog varchar(20))
begin
 insert into treb_prog(treb_prog)
 values(p_treb_prog);
end; //

DELIMITER //
create procedure treb_prog_delete (in p_id_treb_prog int)
begin
 delete from treb_prog
 where id_treb_prog = p_id_treb_prog;
end; //

create table treb_nadezh
(
	id_treb_nadezh int not null auto_increment primary key,
	treb_nadezh varchar(25) not null unique
);

DELIMITER //
create procedure treb_nadezh_update (in p_id_treb_nadezh int, in p_treb_nadezh varchar(25))
begin
 update treb_nadezh set
 treb_nadezh = p_treb_nadezh
 where
  id_treb_nadezh = p_id_treb_nadezh;
end; //

DELIMITER //
create procedure treb_nadezh_insert (in p_treb_nadezh varchar(25))
begin
 insert into treb_nadezh(treb_nadezh)
 values(p_treb_nadezh);
end; //

DELIMITER //
create procedure treb_nadezh_delete (in p_id_treb_nadezh int)
begin
 delete from treb_nadezh
 where id_treb_nadezh = p_id_treb_nadezh;
end; //

create table files
(
	id_file int not null auto_increment primary key,
	ext_file_id int not null references ext_file (id_ext_file),
	type_file_id int not null references type_file (id_type_file),
	path_file varchar(100) not null,
	nazv_file varchar(25) not null,
	date_sozd_file date not null,
	who_made_id int not null references sotrudnik (id_sotrudnik)
);

DELIMITER //
create procedure files_update (in p_id_file int, in p_ext_file_id int, in p_type_file_id int, in p_path_file varchar(100), in p_nazv_file varchar(25), in p_date_sozd_file date, in p_who_made_id int)
begin
 update files set
  ext_file_id = p_ext_file_id,
  type_file_id = p_type_file_id,
  path_file = p_path_file,
  nazv_file = p_nazv_file,
  date_sozd_file = p_date_sozd_file,
  who_made_id = p_who_made_id
 where
  id_file = p_id_file;
end; //

DELIMITER //
create procedure files_insert (in p_ext_file_id int, in p_type_file_id int, in p_path_file varchar(100), in p_nazv_file varchar(25), in p_date_sozd_file date, in p_who_made_id int)
begin
 insert into files (ext_file_id, type_file_id, path_file, nazv_file, date_sozd_file, who_made_id)
     values(p_ext_file_id, p_type_file_id, p_path_file, p_nazv_file, p_date_sozd_file, p_who_made_id);
end; //

DELIMITER //
create procedure files_delete (in p_id_file int)
begin
 delete from files
 where id_file = p_id_file;
end; //

create table zakazchik
(
	id_zakazchik int not null auto_increment primary key,
	sur_zakazchik varchar(50) not null,
	name_zakazchik varchar(50) not null,
	otch_zakazchik varchar(50) null default '-',
	phone_zakazchik varchar(11) not null check (regexp_like(phone_zakazchik, '8[0-9]{10}')) unique,
	mail_zakazchik varchar(25) null default '@.' check (regexp_like(mail_zakazchik, '%@%.%'))
);

DELIMITER //
create procedure zakazchik_update (in p_id_zakazchik int, in p_sur_zakazchik varchar(50), in p_name_zakazchik varchar(50), in p_otch_zakazchik varchar(50), in p_phone_zakazchik varchar(11), in p_mail_zakazchik varchar(25))
begin
 update zakazchik set
 sur_zakazchik = p_sur_zakazchik,
 name_zakazchik = p_name_zakazchik,
 otch_zakazchik = p_otch_zakazchik,
 phone_zakazchik = p_phone_zakazchik,
 mail_zakazchik = p_mail_zakazchik
 where
  id_zakazchik = p_id_zakazchik;
end; //

DELIMITER //
create procedure zakazchik_insert (in p_sur_zakazchik varchar(50), in p_name_zakazchik varchar(50), in p_otch_zakazchik varchar(50), in p_phone_zakazchik varchar(11), in p_mail_zakazchik varchar(25))
begin
 insert into zakazchik(sur_zakazchik, name_zakazchik, otch_zakazchik, phone_zakazchik, mail_zakazchik)
 values(p_sur_zakazchik, p_name_zakazchik, p_otch_zakazchik, p_phone_zakazchik, p_mail_zakazchik);
end; //

DELIMITER //
create procedure zakazchik_delete (in p_id_zakazchik int)
begin
 delete from zakazchik
 where id_zakazchik = p_id_zakazchik;
end; //

create table akt_priem_work
(
	id_priem_work int not null auto_increment primary key,
	nom_priem_work int not null unique,
	date_priem_work date not null,
	who_sdal_priem_work int not null references sotrudnik (id_sotrudnik),
	who_prin_priem_work int not null references zakazchik (id_zakazchik)
);

DELIMITER //
create procedure akt_priem_work_update (in p_id_priem_work int, in p_nom_priem_work int, in p_date_priem_work date, in p_who_sdal_priem_work int, in p_who_prin_priem_work int)
begin
 update akt_priem_work set
 nom_priem_work = p_nom_priem_work,
 date_priem_work = p_date_priem_work,
 who_sdal_priem_work = p_who_sdal_priem_work,
 who_prin_priem_work = p_who_prin_priem_work
 where
  id_priem_work = p_id_priem_work;
end; //

DELIMITER //
create procedure akt_priem_work_insert (in p_nom_priem_work int, in p_date_priem_work date, in p_who_sdal_priem_work int, in p_who_prin_priem_work int)
begin
 insert into akt_priem_work(nom_priem_work, date_priem_work, who_sdal_priem_work, who_prin_priem_work)
 values(p_nom_priem_work, p_date_priem_work, p_who_sdal_priem_work, p_who_prin_priem_work);
end; //

DELIMITER //
create procedure akt_priem_work_delete (in p_id_priem_work int)
begin
 delete from akt_priem_work
 where id_priem_work = p_id_priem_work;
end; //

create table orders
(
	id_orders int not null auto_increment primary key,
	zakazchik_id int not null references zakazchik (id_zakazchik),
	treb_prog_id int not null references treb_prog (id_treb_prog),
	treb_nadezh_id int not null references treb_nadezh (id_treb_nadezh),
	deadline_order date not null
);

DELIMITER //
create procedure orders_update (in p_id_orders int, in p_zakazchik_id int, in p_treb_prog_id int, in p_treb_nadezh_id int, in p_deadline_order date)
begin
 update orders set
 zakazchik_id = p_zakazchik_id,
 treb_prog_id = p_treb_prog_id,
 treb_nadezh_id = p_treb_nadezh_id,
 deadline_order = p_deadline_order
 where
  id_orders = p_id_orders;
end; //

DELIMITER //
create procedure orders_insert (in p_zakazchik_id int, in p_treb_prog_id int, in p_treb_nadezh_id int, in p_deadline_order date)
begin
 insert into orders(zakazchik_id, treb_prog_id, treb_nadezh_id, deadline_order)
 values(p_zakazchik_id, p_treb_prog_id, p_treb_nadezh_id, p_deadline_order);
end; //

DELIMITER //
create procedure orders_delete (in p_id_orders int)
begin
 delete from orders
 where id_orders = p_id_orders;
end; //

create table history_orders
(
	id_history int not null auto_increment primary key,
	priem_work_id int not null references akt_priem_work (ID_priem_work),
	order_ID int not null references orders (ID_orders),
	files_ID int not null references files (ID_file)
);

DELIMITER //
create procedure history_orders_update (in p_id_history int, in p_priem_work_id int, in p_order_ID int, in p_files_ID int)
begin
 update history_orders set
 priem_work_id = p_priem_work_id,
 order_ID = p_order_ID,
 files_ID = p_files_ID
 where
  id_history = p_id_history;
end; //

DELIMITER //
create procedure history_orders_insert (in p_priem_work_id int, in p_order_ID int, in p_files_ID int)
begin
 insert into history_orders(priem_work_id, order_ID, files_ID)
 values(p_priem_work_id, p_order_ID, p_files_ID);
end; //

DELIMITER //
create procedure history_orders_delete (in p_id_history int)
begin
 delete from history_orders
 where id_history = p_id_history;
end; //
