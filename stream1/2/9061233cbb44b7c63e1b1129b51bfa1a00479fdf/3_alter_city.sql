use geodata;

alter table _cities
modify column city_id INT NOT NULL auto_increment,
add primary key (city_id),
modify column country_id INT  ,
modify column important tinyint(1) ,
modify column region_id int ,
modify column title_ru varchar(150)  ,
add index (title_ru),
modify column title_ua VARCHAR(150) ,
modify column title_be VARCHAR(150) ,
modify column title_en VARCHAR(150) ,
modify column title_es VARCHAR(150) ,
modify column title_pt VARCHAR(150) ,
modify column title_de VARCHAR(150) ,
modify column title_fr VARCHAR(150) ,
modify column title_it VARCHAR(150) ,
modify column title_pl VARCHAR(150) ,
modify column title_ja VARCHAR(150) ,
modify column title_lt VARCHAR(150) ,
modify column title_lv VARCHAR(150) ,
modify column title_cz VARCHAR(150) ;



