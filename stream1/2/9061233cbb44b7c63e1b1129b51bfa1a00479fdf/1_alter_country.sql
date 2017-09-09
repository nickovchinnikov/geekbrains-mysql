use geodata;

alter table _countries
modify column  country_id INT NOT NULL auto_increment, 
ADD primary key (country_id ),
modify column title_ru VARCHAR(150) NOT NULL,
add index (title_ru),
modify column title_ua VARCHAR(150) NOT NULL,
modify column title_be VARCHAR(150) NOT NULL,
modify column title_en VARCHAR(150) NOT NULL,
modify column title_es VARCHAR(150) NOT NULL,
modify column title_pt VARCHAR(150) NOT NULL,
modify column title_de VARCHAR(150) NOT NULL,
modify column title_fr VARCHAR(150) NOT NULL,
modify column title_it VARCHAR(150) NOT NULL,
modify column title_pl VARCHAR(150) NOT NULL,
modify column title_ja VARCHAR(150) NOT NULL,
modify column title_lt VARCHAR(150) NOT NULL,
modify column title_lv VARCHAR(150) NOT NULL,
modify column title_cz VARCHAR(150) NOT NULL;
