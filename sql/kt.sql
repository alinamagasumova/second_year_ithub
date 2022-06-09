# create database it_firm;
use it_firm;

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
end //
insert into sotrudnik (sur_sotrudnik, name_sotrudnik, otch_sotrudnik, phone_sotrudnik, mail_sotrudnik, S_P_sotrudnik, N_P_sotrudnik, birth_date_sotrudnik, dolznost_ID) values
('Котин', 'Даниил', 'Максимович', '89125674312', 'meow23564@mail.ru', '6716', '648762', '1998-07-24', 1),
('Зайкин', 'Иван', 'Никитич', '89851543897', 'krolikVanya@mail.ru', '6712', '876123', '1991-04-21', 1),
('Мишкин', 'Михаил', 'Данилович', '89825730869', 'teddyBear00@ya.ru', '6713', '987143', '2000-01-19', 2),
('Колякин', 'Никита', 'Дмитриевич', '89325679988', 'yanekolya@gmail.com', '6714', '567123', '1999-02-13', 1),
('Волчук', 'Дмитрий', 'Кириллович', '89823126622', 'auf158@gmail.com', '6715', '342890', '1998-02-15', 100),
('Клименко', 'Анатолий', 'Беркетович', '89853283222', 'blabla@gmail.com', '6716', '342891', '1998-01-04', 101),
('Собчак', 'Ксения', 'Маратовна', '89821226322', 'tuktuk@gmail.com', '6716', '342892', '1998-07-10', 102),
('Кирсанов', 'Эмиль', 'Романович', '89223123311', 'keklol@gmail.com', '6717', '342893', '1998-08-05', 103),
('Шлямов', 'Никита', 'Максимович', '89223436622', 'tired@gmail.com', '6718', '342894', '1992-12-01', 104),
('Теков', 'Антон', 'Витальевич', '89823112343', 'imagine@gmail.com', '6719', '342895', '1998-05-25', 105),
('Джафарин', 'Рамиль', 'Игоревич', '89523112453', 'dag001@mail.ru', '6812', '362885', '2000-02-25', 106),
('Воробьев', 'Антон', 'Константинович', '89623187343', 'birdAnt@gmail.com', '6819', '300895', '1988-01-10', 107),
('Родионова', 'Наталья', 'Максимовна', '89223194850', 'hataha44@gmail.com', '6710', '312895', '1968-11-02', 108),
('Самохина', 'Анастасия', 'Федоровна', '89851236622', 'fedorovna1986@gmail.com', '6518', '442894', '1986-10-01', 109),
('Семенов', 'Иван', 'Витальевич', '89827290843', 'simens@gmail.com', '6712', '342729', '2003-08-25', 110),
('Борисов', 'Олег', 'Игоревич', '89853118970', 'borolig@ya.ru', '6719', '342895', '1968-05-25', 111),
('Ярославская', 'Василиса', 'Шамильевна', '89823165290', 'vasilisaPrekras@gmail.com', '6729', '341205', '1988-06-25', 112),
('Максимчук', 'Элина', 'Игоревна', '89253900222', 'kalina22@mail.ru', '6616', '342891', '1978-09-14', 113),
('Кабалов', 'Алексей', 'Ильич', '89822212322', 'kabala@gmail.com', '6516', '342892', '1987-04-12', 114),
('Кантемиров', 'Тимофей', 'Денисович', '89229998876', 'kanye234@gmail.com', '6727', '352893', '1973-03-15', 115),
('Кузикина', 'Полина', 'Сергеевна', '89222490122', 'kuzyaka77@gmail.com', '6738', '342994', '1991-02-11', 116),
('Щелков', 'Антон', 'Юрьевич', '89823177777', 'semkisemki66@gmail.com', '6749', '342895', '1994-10-05', 117),
('Стрельнов', 'Василий', 'Кириллович', '89853002343', 'strelkaVas@gmail.com', '6909', '342595', '1994-07-13', 118),
('Регеленко', 'Мария', 'Александровна', '89853112787', 'regel@gmail.com', '6379', '972895', '1993-06-14', 119),
('Шейко', 'Екатерина', 'Даниловна', '89212345671', 'shakie@gmail.com', '6217', '342893', '1995-08-15', 120),
('Данилов', 'Роман', 'Тигранович', '89997654622', 'yandex@ya.ru', '6318', '352894', '1982-12-16', 121),
('Шаповалов', 'Иван', 'Максимович', '89824567343', 'superHero@gmail.com', '6419', '542895', '1983-05-17', 122),
('Пустовалова', 'Алена', 'Игнатьевна', '89856782343', 'pustota@gmail.com', '6519', '642895', '1984-02-18', 123),
('Соколова', 'Яна', 'Дмитриевна', '89823629043', 'bird85@gmail.com', '6619', '742895', '1985-03-19', 124),
('Игнатюк', 'Анатолий', 'Варужанович', '89853500222', 'ignatyk_anatoliy@gmail.com', '6716', '842891', '1986-01-20', 125),
('Банев', 'Петр', 'Романович', '89822123889', 'govbanyu@gmail.com', '6816', '942892', '1987-10-21', 126),
('Лаптева', 'Юлия', 'Ивановна', '89227683409', 'lapot@gmail.com', '6917', '142893', '1988-09-22', 127),
('Кондратьев', 'Рамазан', 'Максимович', '89023387222', 'mistake@gmail.com', '6338', '756293', '1992-01-23', 128),
('Большаков', 'Илья', 'Андреевич', '89158900349', 'bigIlya@gmail.com', '6569', '678194', '1988-11-24', 129),
('Маликов', 'Андрей', 'Дениоович', '89121235363', 'smallDrew@gmail.com', '6789', '673284', '1998-11-13', 130),
('Телегин', 'Тимофей', 'Витальевич', '89253148298', 'telega@gmail.com', '6779', '350280', '1998-08-26', 131),
('Бизанова', 'Ева', 'Даниловна', '89722739561', 'evailoved@gmail.com', '6915', '148322', '1998-08-27', 132),
('Юнсова', 'Варвара', 'Никитична', '89322345965', 'imgood@mail.ru', '6311', '387569', '1991-10-18', 133),
('Шошаева', 'Раида', 'Алановна', '89522763891', 'rayka00@gmail.com', '6423', '351657', '2000-02-03', 134),
('Калтыкин', 'Георгий', 'Тимофеевич', '89823469605', 'kaltyk@gmail.com', '6322', '379576', '2000-04-30', 135),
('Ершова', 'Валерия', 'Дмитриевна', '89859828056', 'poshti@gmail.com', '6826', '362598', '2001-10-20', 136),
('Ерошина', 'Юлия', 'Юрьевна', '89822438749', 'finished@gmail.com', '6219', '376983', '1999-06-11', 137),
('Голышев', 'Кирилл', 'Романович', '89256738910', 'faster@gmail.com', '6715', '377881', '1997-09-22', 138),
('Козлов', 'Арсений', 'Максимович', '89220082723', 'goatArs@gmail.com', '6318', '987133', '1997-12-03', 139),
('Коровкин', 'Дионис', 'Игнатьевич', '89829828301', 'wannaHome@gmail.com', '6419', '345678', '1996-08-04', 140),
('Донцов', 'Антон', 'Валерьевич', '89826786005', 'dontsov@gmail.com', '6919', '224596', '1996-10-05', 141),
('Голомидова', 'Алина', 'Дмитриевна', '89823156742', 'shashniki@gmail.com', '6519', '768344', '1995-11-06', 142),
('Ярмоленко', 'Артем', 'Кириллович', '89221359807', 'igrotehnik@gmail.com', '6717', '390687', '1995-09-07', 143),
('Лесова', 'Олеся', 'Артемовна', '89225476198', 'podolnikha@gmail.com', '6218', '378957', '1980-12-08', 144),
('Казанцева', 'Алёна', 'Арсеньевна', '89853672056', 'tatrstan@gmail.com', '6319', '274381', '1990-05-09', 145),
('Аюпов', 'Максим', null, '89851234567', 'elinafirstschool@gmail.com', '6419', '342295', '1990-07-10', 146);

create table history_sotrudnik
(
	id_history_sotrudnik int not null auto_increment primary key,
    record_status varchar (30) not null,
    sotrudnik_info varchar (100) not null,
    dolznost_info varchar (100) not null,
    date_create timestamp null default now()
);
DELIMITER //
create trigger tg_sotrudnik_insert
after insert on sotrudnik
for each row
begin
	if NEW.id_sotrudnik then
		insert into history_sotrudnik (record_status, sotrudnik_info, dolznost_info)
        values ('Новая запись', (select concat('Имя: ', sur_sotrudnik,' ',substr(name_sotrudnik from 1 for 1))
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
        (select concat('Имя: ', sur_sotrudnik,' ',substr(name_sotrudnik from 1 for 1))
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
        (select concat('Имя: ', sur_sotrudnik,' ',substr(name_sotrudnik from 1 for 1))
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
insert into dolznost(nazv_dolznost) values ('HR'), ('Генеральный директор'), ('Актёр озвучивания'), ('Ассистент'), ('Служба поддержки'), ('Тимлид отдела дизайн'), ('Тимлид отдела гейм'), ('Звукорежиссер'), ('Тимлид звукорежиссеров'), ('Пиар менеджер'), ('Адвокат'), ('Менеджер'), ('Продюсер'), ('Гейм-девелопер'), ('Дизайнер'), ('Тестировщик'), ('Топ-менеджер'), ('Исполнительный директор'), ('Стажёр'), ('ДевОпс'), ('Финансист'), ('Бухгалтер'), ('Переводчик'), ('Арт-директор'), ('Коммерческий директор'), ('Технический директор'), ('Финансовый директор'), ('Системный администратор'), ('Левел-дизайнер'), ('Тимлид отдела левел'), ('Копирайтер'), ('Тимлид художников по персонажам'), ('Художник по персонажам'), ('Моделлер'), ('Нарративный дизайнер'), ('Аналитик'), ('Маркетолог'), ('Аниматор'), ('Тимлид аниматоров'), ('Тимлид моделлеров'), ('Торговый представитель'), ('Локализатор'), ('Комьюнити-менеджер'), ('СММ-специалист'), ('Сотрудник службы поддержки'), ('UI-дизайнер');
call dolznost_insert('Директор');
call dolznost_insert('Программист ИИ');

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
call ext_file_insert('zip');
call ext_file_insert('rar');

create table treb_prog
(
	id_treb_prog int not null auto_increment primary key,
	treb_prog varchar(100) not null unique
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
insert into treb_prog(treb_prog) values ('Сюжетно-ролевая'), ('Текстовый квест'), ('Детектив'), ('Симулятор жизни'), ('РПГ'), ('Открытый мир'), ('Викторина'), ('Для детей'), ('Шутер'), ('Сюжетная'), ('Расслабляющая'), ('Визуальная новелла'), ('Стратегическая'), ('Аркада'), ('Экшн'), ('Платформер'), ('Ритм-игра'), ('Выживание'), ('Приключение'), ('Хоррор'), ('ММОРПГ'), ('Гача игры'), ('МОВА'), ('Карточная'), ('Гонки'), ('Спортивная'), ('Головоломка'), ('Логическая'), ('Эскейп'), ('4Д-игра'), ('Казуальная'), ('Кликер'), ('Артхаус'), ('Рекламная'), ('Творческая'), ('Обучающая'), ('Симулятор строительства'), ('Симулятор техники'), ('Файтинг'), ('Метроидвания'), ('Графический квест'), ('Симулятор бога'), ('ДРПГ'), ('Соулслайк'), ('Симулятор свиданий'), ('Дефенс башни'), ('ВарГейм'), ('Автобатлер'), ('ESCAPE THE ROOM'), ('Инкрементальная');

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
insert into treb_nadezh(treb_nadezh) values ('Очень надежная'), ('Средне надежная'), ('Надежная'), ('Не очень надежная'), ('Вообще ненадежная');

create table files
(
	id_file int not null auto_increment primary key,
	ext_file_id int not null references ext_file (id_ext_file),
	nazv_file varchar(25) not null,
	date_sozd_file date not null,
	who_made_id int not null references sotrudnik (id_sotrudnik)
);
DELIMITER //
create procedure files_update (in p_id_file int, in p_ext_file_id int, in p_nazv_file varchar(25), in p_date_sozd_file date, in p_who_made_id int)
begin
 update files set
  ext_file_id = p_ext_file_id,
  nazv_file = p_nazv_file,
  date_sozd_file = p_date_sozd_file,
  who_made_id = p_who_made_id
 where
  id_file = p_id_file;
end; //
DELIMITER //
create procedure files_insert (in p_ext_file_id int, in p_nazv_file varchar(25), in p_date_sozd_file date, in p_who_made_id int)
begin
 insert into files (ext_file_id, nazv_file, date_sozd_file, who_made_id)
     values(p_ext_file_id, p_nazv_file, p_date_sozd_file, p_who_made_id);
end; //
DELIMITER //
create procedure files_delete (in p_id_file int)
begin
 delete from files
 where id_file = p_id_file;
end; //
insert into files(ext_file_id, nazv_file, date_sozd_file, who_made_id) values
(1, 'order1', '2016-01-20', 491),
(1, 'order2', '2017-02-20', 491),
(1, 'order3', '2018-03-20', 491),
(1, 'order4', '2018-05-20', 491),
(1, 'order5', '2018-10-20', 491),
(1, 'order6', '2019-04-20', 491),
(1, 'order7', '2019-11-20', 491),
(1, 'order8', '2020-02-20', 491),
(1, 'order9', '2020-06-20', 491),
(1, 'order10', '2020-09-20', 491),
(1, 'order11', '2020-11-20', 491),
(1, 'order12', '2021-01-20', 491),
(1, 'order13', '2021-03-20', 491),
(1, 'order14', '2021-05-20', 491),
(1, 'order15', '2021-08-20', 491),
(1, 'order16', '2021-10-20', 491),
(1, 'order17', '2021-12-20', 491),
(1, 'order18', '2022-02-20', 491),
(1, 'order19', '2022-04-20', 491),
(1, 'order20', '2019-07-20', 491),
(2, 'order21', '2016-10-20', 491),
(2, 'order22', '2015-03-20', 491),
(2, 'order23', '2015-07-20', 491),
(2, 'order24', '2015-12-20', 491),
(2, 'order25', '2014-04-20', 491),
(2, 'order26', '2014-08-20', 491),
(2, 'order27', '2014-12-20', 491),
(2, 'order28', '2013-01-20', 491),
(2, 'order29', '2013-04-20', 491),
(2, 'order30', '2013-08-20', 491),
(2, 'order31', '2013-12-20', 491),
(2, 'order32', '2012-03-20', 491),
(2, 'order33', '2012-05-20', 491),
(2, 'order34', '2012-09-20', 491),
(2, 'order35', '2012-12-20', 491),
(2, 'order36', '2011-02-20', 491),
(2, 'order37', '2011-06-20', 491),
(2, 'order38', '2011-10-20', 491),
(2, 'order39', '2011-12-20', 491),
(2, 'order40', '2010-01-20', 491),
(2, 'order41', '2010-04-20', 491),
(2, 'order42', '2010-06-20', 491),
(2, 'order43', '2010-09-20', 491),
(2, 'order44', '2010-11-20', 491),
(2, 'order45', '2010-12-20', 491),
(1, 'order46', '2009-01-20', 491),
(1, 'order47', '2009-05-20', 491),
(1, 'order48', '2009-08-20', 491),
(1, 'order49', '2009-09-20', 491),
(1, 'order50', '2009-11-20', 491);

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
alter table zakazchik add check (regexp_like(mail_zakazchik, '(.*)@(.*)\.(.*)'));
insert into zakazchik(sur_zakazchik, name_zakazchik, otch_zakazchik, phone_zakazchik, mail_zakazchik) values
('Алеева', 'Екатерина', 'Георгиевна', '89567438291', 'aleeva345@gmail.com'),
('Васильев', 'Николай', 'Алексеевич', '89853474562', 'vasilnik@mail.ru'),
('Поддубный', 'Александр', 'Дмитриевич', '89853207562', 'dublex@ya.ru'),
('Самохин', 'Владислав', 'Николаевич', '89320074562', 'vladi20054@gmail.com'),
('Бикулов', 'Дмитрий', 'Рамильевич', '89853123456', 'bikbik100@mail.ru'),
('Агапова', 'Екатерина', 'Романовна', '89123456562', 'agaagaek@gmail.com'),
('Кертанов', 'Василий', 'Берканович', '89224567390', 'heyvasya@mail.ru'),
('Пупкин', 'Семен', 'Викторович', '89120091282', 'pupok2001@gmail.com'),
('Литвинков', 'Никита', 'Евгеньевич', '89851982038', 'teaisaman@ya.ru'),
('Карташов', 'Николай', 'Владимирович', '89270192837', 'potato1209@gmail.com'),
('Копатов', 'Максим', 'Данилович', '89851382276', 'smeahr1243@mail.ru'),
('Петрова', 'Анна', 'Максимовна', '89807654985', 'petrushkina@gmail.com'),
('Кетрова', 'Ксения', 'Никитична', '89372640060', 'ketter@ya.ru'),
('Кедрова', 'Виталина', 'Дмитриевна', '89678428113', 'imnotatree@mail.ru'),
('Метрова', 'Ева', 'Давидовна', '89567832735', 'wannasleap@gmail.com'),
('Сетрова', 'Мария', 'Антоновна', '89078654341', 'coachPotato45@mail.ru'),
('Фетрова', 'Софья', 'Юрьевна', '89678432712', 'fetrshelk@gmail.com'),
('Стышов', 'Никита', 'Романович', '89078986512', 'badGuy@gmail.com'),
('Латышев', 'Георгий', 'Александрович', '89568711234', 'george657@gmail.com'),
('Линдинберг', 'Давид', 'Анатольевич', '89230984672', 'germanytop@gmail.com'),
('Дрей', 'Татьяна', 'Алексеевна', '89765423908', 'btsssss@gmail.com'),
('Ли', 'Дмитрий', 'Сергеевич', '89867512113', 'asianSoup@gmail.com'),
('Малахова', 'Алина', 'Сергеевна', '89564326890', 'lethemspeak@mail.ru'),
('Салахова', 'Анна', 'Евгеньевна', '89824357015', 'sahalann3@ya.ru'),
('Палахова', 'Яна', 'Егоровна', '89564387203', 'yann235@mail.ru'),
('Калахова', 'София', 'Игоревна', '89780643771', 'sof35@ya.ru'),
('Максимова', 'Арина', 'Павловна', '89807865443', 'maks7arr@ya.ru'),
('Магасумова', 'Диана', 'Кавсаровна', '88765466576', 'absolutnoPofig@gmail.com'),
('Петрова', 'Марина', 'Владиславовна', '89777777771', 'petrov578@mail.ru'),
('Романов', 'Никита', 'Владимирович', '89807862232', 'aueaue@gmail.com'),
('Данилов', 'Кирилл', 'Владимирович', '89675445567', 'taganka@mail.ru'),
('Мирцхулава', 'Никита', 'Владиславович', '89807060504', 'armenia567@mail.ru'),
('Околелов', 'Антон', 'Ильич', '89123217866', 'okolAnt@gmail.com'),
('Донской', 'Роман', 'Анатольевич', '89780675411', 'riversRoman@mail.ru'),
('Белявский', 'Роман', 'Владиславович', '89342776400', 'barashkags@mail.ru'),
('Кравчук', 'Мария', 'Александровна', '89876654204', 'klassteacher@gmail.com'),
('Пачганова', 'Элина', 'Владимировна', '89564737551', 'photogrAle@gmail.com'),
('Аухатова', 'Виктория', 'Николаевна', '89672946572', 'medsiVik@ya.ru'),
('Кошкарев', 'Павел', 'Викторович', '89807867545', 'denchik@mail.ru'),
('Регель', 'Дмитрий', 'Викторович', '89675342113', 'bottleofwater@gmail.com'),
('Шейко', 'Максим', 'Юрьевич', '89677546353', 'oldfashioned@mail.ru'),
('Аюпова', 'Оксана', 'Борисовна', '89675568231', 'prumpurum@mail.ru'),
('Малетина', 'Эльмира', 'Олеговна', '89807624132', 'deadinside23@mail.ru'),
('Фалин', 'Илья', 'Олегович', '89556746437', 'sleepydumpl@mail.ru'),
('Жгилёв', 'Максим', 'Борисович', '89564378200', 'lexusdine@mail.ru'),
('Захаров', 'Илья', 'Артёмович', '89876005673', 'znakhar@gmail.com'),
('Иванов', 'Дмитрий', 'Павлович', '89564380070', 'onexbet@mail.ru'),
('Мирончук', 'Кирилл', 'Антонович', '89567382916', 'superprogr@mail.ru'),
('Бельский', 'Антон', 'Сергеевич', '89674382715', 'businessmaster@mail.ru'),
('Дмитриенко', 'Павел', 'Николаевич', '89673346670', 'ennglishtutor@mail.ru');

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
insert into akt_priem_work(nom_priem_work, date_priem_work, who_sdal_priem_work, who_prin_priem_work) values
(123456789, '2016-01-26', 467, 69),
(234567890, '2017-03-01', 467, 70),
(345678901, '2018-03-24', 467, 71),
(456789012, '2018-05-25', 467, 82),
(567890123, '2018-10-27', 467, 83),
(678901234, '2019-04-22', 467, 84),
(789012345, '2019-11-25', 467, 85),
(890123456, '2020-03-01', 467, 86),
(901234567, '2020-06-26', 467, 87),
(012345678, '2020-10-29', 467, 88),
(098765432, '2020-11-23', 467, 89),
(987654321, '2021-01-24', 467, 90),
(876543210, '2021-03-25', 467, 91),
(765432109, '2021-05-27', 467, 92),
(654321098, '2021-09-26', 467, 93),
(543210987, '2021-10-28', 467, 94),
(432109876, '2021-12-26', 467, 95),
(321098765, '2022-04-29', 467, 96),
(210987654, '2019-07-23', 467, 97),
(109876543, '2016-10-22', 467, 98),
(135792468, '2015-03-21', 467, 99),
(246801357, '2015-08-01', 467, 100),
(357924680, '2015-12-21', 467, 101),
(468024680, '2014-04-23', 467, 102),
(135791245, '2014-08-28', 467, 103),
(192837465, '2014-12-27', 467, 104),
(102938475, '2013-01-28', 467, 105),
(182736450, '2013-04-02', 467, 106),
(203948576, '2013-08-29', 467, 107),
(283746509, '2013-12-26', 467, 108),
(304958671, '2012-03-22', 467, 109),
(310298475, '2012-05-25', 467, 110),
(024689753, '2012-09-24', 467, 111),
(233455677, '2012-12-27', 467, 112),
(112233445, '2011-03-28', 467, 113),
(668794443, '2011-06-30', 467, 114),
(228339500, '2011-11-29', 467, 115),
(782346742, '2011-12-23', 467, 116),
(348764109, '2010-01-21', 467, 117),
(345698736, '2010-04-23', 467, 118),
(123073793, '2010-06-26', 467, 119),
(876347874, '2010-09-25', 467, 120),
(765423468, '2010-11-28', 467, 121),
(012349429, '2010-12-27', 467, 122),
(015208583, '2009-05-26', 467, 123),
(347831569, '2009-08-21', 467, 124),
(234569876, '2009-09-22', 467, 125),
(654234567, '2009-11-26', 467, 126),
(098764569, '2009-01-23', 467, 127),
(045679840, '2022-03-01', 467, 128);

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
call orders_insert(128, 1, 4, '2022-03-05');
insert into orders(zakazchik_id, treb_prog_id, treb_nadezh_id, deadline_order) values
(69, 1, 1, '2016-01-30'),
(70, 2, 2, '2017-03-05'),
(71, 3, 3, '2018-03-30'),
(82, 4, 4, '2018-05-30'),
(83, 5, 5, '2018-10-30'),
(84, 1, 1, '2019-04-30'),
(85, 2, 2, '2019-11-30'),
(86, 3, 3, '2020-03-05'),
(87, 4, 4, '2020-06-30'),
(88, 5, 5, '2020-10-30'),
(89, 1, 1, '2020-11-30'),
(90, 2, 2, '2021-01-30'),
(91, 3, 3, '2021-03-30'),
(92, 4, 4, '2021-05-30'),
(93, 5, 5, '2021-09-30'),
(94, 1, 1, '2021-10-30'),
(95, 2, 2, '2021-12-30'),
(96, 3, 3, '2022-04-30'),
(97, 4, 4, '2019-07-30'),
(98, 5, 5, '2016-10-30'),
(99, 1, 1, '2015-03-30'),
(100, 2, 2, '2015-08-05'),
(101, 3, 3, '2015-12-30'),
(102, 4, 4, '2014-04-30'),
(103, 5, 5, '2014-08-30'),
(104, 1, 1, '2014-12-30'),
(105, 2, 2, '2013-01-30'),
(106, 3, 3, '2013-04-05'),
(107, 4, 4, '2013-08-30'),
(108, 5, 5, '2013-12-30'),
(109, 1, 1, '2012-03-30'),
(110, 2, 2, '2012-05-30'),
(111, 3, 3, '2012-09-30'),
(112, 4, 4, '2012-12-30'),
(113, 5, 5, '2011-03-30'),
(114, 1, 1, '2011-06-30'),
(115, 2, 2, '2011-11-30'),
(116, 3, 3, '2011-12-30'),
(117, 4, 4, '2010-01-30'),
(118, 5, 5, '2010-04-30'),
(118, 4, 4, '2010-06-30'),
(119, 5, 5, '2010-09-30'),
(120, 4, 4, '2010-11-30'),
(121, 5, 5, '2010-12-30'),
(122, 1, 1, '2009-01-30'),
(123, 2, 2, '2009-05-30'),
(124, 3, 3, '2009-08-30'),
(125, 4, 4, '2009-09-30'),
(126, 5, 5, '2009-11-30');

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
insert into history_orders(priem_work_id, order_ID, files_ID) values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25),
(26, 26, 26),
(27, 27, 27),
(28, 28, 28),
(29, 29, 29),
(30, 30, 30),
(31, 31, 31),
(32, 32, 32),
(33, 33, 33),
(34, 34, 34),
(35, 35, 35),
(36, 36, 36),
(37, 37, 37),
(38, 38, 38),
(39, 39, 39),
(40, 40, 40),
(41, 41, 41),
(42, 42, 42),
(43, 43, 43),
(44, 44, 44),
(45, 45, 45),
(46, 46, 46),
(47, 47, 47),
(48, 48, 48),
(49, 49, 49),
(50, 50, 50);


select avg(S_P_sotrudnik) from sotrudnik;
select sum(S_P_sotrudnik) from sotrudnik;
select min(S_P_sotrudnik) from sotrudnik;
select count(*) from orders;
select count(distinct name_sotrudnik) from sotrudnik;

SELECT CONCAT('Oh', 'My', 'God');
SELECT INSERT('Mathematician', 5, 4, 'Love');
SELECT LOWER('WILL I REALLY  BE SMALL?');
SELECT SUBSTRING('Unuseful',5);
SELECT SUBSTRING('Unuseful' FROM 4);
SELECT SUBSTRING('Unuseful',5,6);
SELECT SUBSTRING('Unuseful', -3);
SELECT SUBSTRING('Unuseful', -6, 3);
SELECT SUBSTRING('Unuseful' FROM -4 FOR 2);
SELECT UPPER('will i  really be big?');
SELECT REPEAT('tired', 20);
SELECT REPLACE('alina no', 'no', 'yes');
SELECT REVERSE('hahahahah');

SELECT NOW();
SELECT SYSDATE();
SELECT CURRENT_TIMESTAMP();
SELECT CURRENT_DATE();
SELECT CURDATE();
SELECT CURRENT_TIME();
SELECT CURTIME();
SELECT DAYOFMONTH('2022-03-27');
SELECT DAYOFWEEK('2022-03-27');
SELECT DAYOFYEAR('2022-03-27');
SELECT MONTH('2022-03-27');
SELECT YEAR('2022-03-27');
SELECT QUARTER('2022-03-27');
SELECT WEEK('2022-03-27', 1);
SELECT LAST_DAY('2022-03-27');
SELECT DAYNAME('2022-03-27');
SELECT MONTHNAME('2022-03-27');
SELECT HOUR('16:23:05');
SELECT MINUTE('16:23:05');
SELECT SECOND('16:23:05');

SELECT EXTRACT(SECOND FROM '2022-03-27 16:23:05');
SELECT EXTRACT(MINUTE FROM '2022-03-27 16:23:05');
SELECT EXTRACT(HOUR FROM '2022-03-27 16:23:05');
SELECT EXTRACT(DAY FROM '2022-03-27 16:23:05');
SELECT EXTRACT(MONTH FROM '2022-03-27 16:23:05');
SELECT EXTRACT(YEAR FROM '2022-03-27 16:23:05');
SELECT EXTRACT(MINUTE_SECOND FROM '2022-03-27 16:23:05');
SELECT EXTRACT(DAY_HOUR FROM '2022-03-27 16:23:05');
SELECT EXTRACT(YEAR_MONTH FROM '2022-03-27 16:23:05');
SELECT EXTRACT(HOUR_SECOND FROM '2022-03-27 16:23:05');
SELECT EXTRACT(DAY_MINUTE FROM '2022-03-27 16:23:05');
SELECT EXTRACT(DAY_SECOND FROM '2022-03-27 16:23:05');

SELECT DATE_ADD('2022-03-27', INTERVAL 24 DAY);
SELECT DATE_ADD('2022-03-27', INTERVAL 9 MONTH);
SELECT DATE_ADD('2022-03-27 16:23:05', INTERVAL 2 HOUR);
SELECT DATE_SUB('2022-03-27', INTERVAL 8 DAY);
SELECT DATEDIFF('2022-03-27', '2017-05-28');
SELECT DATEDIFF('2022-03-27', '2017-01-29');
SELECT DATEDIFF('2022-03-27', '2022-03-27');
SELECT TO_DAYS('2022-03-27');
SELECT TIME_TO_SEC('10:00');

SELECT DATE_FORMAT('2018-05-25', '%W %d/%m/%y');
SELECT DATE_FORMAT('2018-05-25 16:23:05', '%d %M %Y');
SELECT DATE_FORMAT('2018-05-25 16:23:05', '%r');
SELECT TIME_FORMAT('2018-05-25 16:23:05', '%H:%i:%S');
SELECT TIME_FORMAT('21:25:54', '%k:%i');

# 1
show databases;
select * from information_schema.columns where TABLE_SCHEMA = "it_firm";
# 2
select TABLE_SCHEMA as 'Название БД', count(TABLE_NAME) as 'Количество таблиц' from information_schema.tables
where TABLE_SCHEMA like "it_firm" group by TABLE_SCHEMA;
# 3
select TABLE_SCHEMA as 'Название БД', count(*) as 'Количество столбцов' from information_schema.columns
where TABLE_SCHEMA like "it_firm" group by TABLE_SCHEMA;
# 4
select TABLE_SCHEMA as 'Название БД', TABLE_NAME as 'Название таблицы', count(*) as 'Количество столбцов'
from information_schema.columns where TABLE_SCHEMA like "it_firm" group by TABLE_SCHEMA, TABLE_NAME;
# 5
select TABLE_SCHEMA as 'Название БД', count(*) as 'Количество столбцов'
from information_schema.columns where TABLE_SCHEMA = "it_firm" and EXTRA = "auto_increment";
# 6
select TABLE_SCHEMA as 'Название БД', count(distinct COLUMN_NAME) as 'Количество distinct столбцов name'
from information_schema.columns where TABLE_SCHEMA = "it_firm";
# 7
select TABLE_SCHEMA as 'Название БД', count(*) as 'Количество int столбцов'
from information_schema.columns where TABLE_SCHEMA = "it_firm" and DATA_TYPE = "int";
# 8
select TABLE_SCHEMA as 'Название БД', count(*) as 'Количество varchar столбцов'
from information_schema.columns where TABLE_SCHEMA = "it_firm" and DATA_TYPE = "varchar";
# 9
select TABLE_SCHEMA as 'Название БД', count(*) as 'Количество date столбцов'
from information_schema.columns where TABLE_SCHEMA = "it_firm" and DATA_TYPE = "date";
# 10
show procedure status where db = 'it_firm';
# 11
select count(*) from information_schema.tables where table_schema = 'it_firm'and table_type = 'VIEW';
# 12
show function status where db = 'it_firm' ;
# 13
select count(*) from information_schema.triggers where trigger_schema = 'it_firm';

# транзакции
# 1
start transaction;
savepoint ext_save_point;
call ext_file_insert('wav');
select * from ext_file;
rollback to savepoint ext_save_point;
# 2
start transaction;
savepoint ext_delete_save_point;
call ext_file_delete(4);
select * from ext_file;
rollback to savepoint ext_delete_save_point;
# 3
start transaction;
savepoint treb_nadezh_save_point;
call treb_nadezh_insert('Роллбэк');
select * from treb_nadezh;
rollback to savepoint treb_nadezh_save_point;

# 4
start transaction;
savepoint treb_nadezh_delete_save_point;
call treb_nadezh_delete(6);
select * from treb_nadezh;
rollback to savepoint treb_nadezh_delete_save_point;

# 5
start transaction;
savepoint dolznost_save_point;
call dolznost_insert('event-manager');
select * from dolznost;
rollback to savepoint dolznost_save_point;


select year(date_priem_work) as 'Год', count(*) as 'Количество выполненных проектов' from akt_priem_work where date_priem_work between '2015-01-01' and '2020-12-31' group by year(date_priem_work) order by year(date_priem_work) asc;

select date_priem_work as 'Дата заказа', concat(substring(sur_zakazchik, 1, 1), '. ', name_zakazchik, ' ', otch_zakazchik) as 'Ф. Имя Отчество: ', phone_zakazchik as 'Телефон заказчика' from akt_priem_work join zakazchik on akt_priem_work.who_prin_priem_work = zakazchik.id_zakazchik order by date_priem_work asc limit 5;

select date_priem_work as 'Сдача работы', deadline_order as 'Дедлайн', floor(hour(timediff(date_priem_work, deadline_order))/24) as 'Дней до дедлайна' from akt_priem_work join history_orders ho on akt_priem_work.id_priem_work = ho.priem_work_id join orders o on ho.order_ID = o.id_orders where date_priem_work between '2021.01.01' and '2022.12.31' order by date_priem_work asc;

select sur_sotrudnik as 'Фамилия', name_sotrudnik as 'Имя', phone_sotrudnik as 'Телефон', mail_sotrudnik as 'Почта', nazv_dolznost as 'Должность' from sotrudnik join dolznost d on sotrudnik.dolznost_ID = d.id_dolznost where nazv_dolznost like 'Тимлид %';

select sur_sotrudnik as 'Фамилия', name_sotrudnik as 'Имя', phone_sotrudnik as 'Телефон', mail_sotrudnik as 'Почта', nazv_dolznost as 'Должность' from sotrudnik join dolznost d on sotrudnik.dolznost_ID = d.id_dolznost where nazv_dolznost like '%Директор%';