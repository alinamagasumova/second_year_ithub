# create database test_mysql;
use test_mysql;

create table employee
(
    id_employee int not null auto_increment primary key,
    first_name varchar(30) not null,
    second_name varchar(30) not null,
    last_name varchar(30) null default '-',
    date_of_create timestamp null default now(),
    phone_number varchar(17) not null unique check
        (regexp_like(phone_number, '\\+7\\([0-9]{3}\\)[0-9]{3}\\-[0-9]{2}\\-[0-9]{2}')),
    e_mail varchar(400) null default '@.' check (e_mail like '%@%.%')
);

delimiter //
create procedure employee_update (in p_id_employee int, in p_first_name varchar (30), in p_second_name varchar (30),
    in p_last_name varchar (30), in p_phone_number varchar (17) ,in p_e_mail varchar (400))
begin
    declare have_record int;
    select count(*) into have_record from employee
    where first_name = p_first_name and second_name = p_second_name and last_name = p_last_name;
    if have_record = 0 then
        update employee set
                            first_name = p_first_name,
                            second_name = p_second_name,
                            last_name = p_last_name,
                            phone_number = p_phone_number,
                            e_mail = p_e_mail
        where id_employee = p_id_employee;
    end if;
end //

delimiter //
create procedure Employee_delete (in p_id_employee int)
begin
    declare have_record int;
    select count(*) into have_record from Combination
    where employee_id = p_id_employee;
    if have_record = 0 then
        delete from Employee
            where id_employee = p_id_employee;
    end if;
end; //

delimiter //
create procedure employee_insert (in p_first_name varchar (30), in p_second_name varchar (30),
    in p_last_name varchar (30), in p_phone_number varchar (17) ,in p_e_mail varchar (400))
begin
     declare have_record int;
    select count(*) into have_record from Employee
    where first_name = p_first_name and second_name = p_second_name
    and last_name = p_last_name;
    if have_record = 0 then
        insert into Employee(first_name, second_name, last_name, phone_number, e_mail)
        values (p_first_name, p_second_name, p_last_name, p_phone_number, p_e_mail);
    end if;
end //

delimiter //
create function employee_money_count (p_id_employee int)
returns decimal (38,2)
    deterministic
    begin
        declare total_sum decimal(38,2);
        select sum(post_price*post_part*0.87) into total_sum from combination
            inner join post on id_post = combination.post_id
        where employee_id = p_id_employee;
        return total_sum;
    end //

create table post
(
  id_post int not null auto_increment primary key,
  post_name varchar(50) not null unique,
  post_price decimal (38, 2) null default 0.0 check (post_price>=0)
);

create table combination
(
    id_combination int not null auto_increment primary key,
    employee_id int not null,
    post_id int not null,
    post_part decimal(38,1) null default 0.1 check (post_part>0),
    foreign key (employee_id) references employee (id_employee),
    foreign key (post_id) references post (id_post)
);

create or replace view employee_combination
as
    select first_name, second_name, last_name, post_name, post_price from combination
    inener join employee on inener.employee_id = id_employee
    inner join post on inener.post_id = id_post;

create table employee_history
(
    id_employee_history int not null auto_increment primary key,
    employee_info varchar(90) not null,
    post_info varchar(100) not null,
    date_of_create timestamp null default now(),
    status_record varchar(100) not null
);

delimiter //
create trigger tg_combination_insert after insert on combination
    for each row
    begin
        if new.id_combination then
            insert into employee_history (employee_info, post_info, status_record)
                values ((select concat(first_name,' ',second_name,' ', last_name) as employee where id_employee = new.employee_id),
                       (select post_name from post where id_post = new.post_id), 'Новая запись');
        end if;
    end //