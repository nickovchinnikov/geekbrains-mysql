
use geodata;

-- изменения таблицы _countries 


alter table _countries drop column country_id;


alter table _countries add column id int not null auto_increment primary key ;
alter table _countries add title_ru varchar(150) not null ;  -- так для все остальных колонок таблицы _countries :\
alter table _countries add  index (title_ru); -- так для все остальных колонок таблицы _countries :\ или нет


-- изменения таблицы _regions  


alter table _regions  drop column region_id; -- удаление колонки 


alter table _regions add column id int not null auto_increment primary key ;


alter table _regions add constraint fk_countries foreign key (cointry_id) references _countries (id);
alter table _regions add country_id int not null;


alter table _regions add title_ru varchar(150) not null;
alter table _regions add index (title_ru); --  так для все остальных колонок  :\



-- изменение таблицы _cities 



alter table _cities drop column city_id ;


alter table _cities add column id int not null auto_increment primary key ;


alter table _cities add country_id int not null;
alter table _cities add constraint fk_countries foreign key (country_id) references _countries (id);


alter table _cities add important tinyint(1) not null ;

alter table _cities add region_id int not null;
alter table _cities add constraint fk_regions_id foreign key (region_id) references _regions (id);


alter table _cities add title_ru varchar(150) not null;
alter table _cities add index (title_ru); --  так для все остальных колонок  :\