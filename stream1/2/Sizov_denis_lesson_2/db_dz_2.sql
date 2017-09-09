use geodata;

ALTER TABLE `_cities`
drop `area_ru` ,
drop   `region_ru` ,
drop   `title_ua` ,
drop   `area_ua` ,
drop   `region_ua` ,
drop   `title_be` ,
drop   `area_be` ,
drop   `region_be` ,
drop   `title_en` ,
drop   `area_en` ,
drop   `region_en` ,
drop   `title_es` ,
drop   `area_es` ,
drop   `region_es` ,
drop   `title_pt` ,
drop   `area_pt` ,
drop   `region_pt` ,
drop   `title_de` ,
drop   `area_de` ,
drop   `region_de` ,
drop   `title_fr` ,
drop   `area_fr` ,
drop   `region_fr` ,
drop   `title_it` ,
drop   `area_it` ,
drop   `region_it` ,
drop   `title_pl` ,
drop   `area_pl` ,
drop   `region_pl` ,
drop   `title_ja` ,
drop   `area_ja` ,
drop   `region_ja` ,
drop   `title_lt` ,
drop   `area_lt` ,
drop   `region_lt` ,
drop   `title_lv` ,
drop   `area_lv` ,
drop   `region_lv` ,
drop   `title_cz` ,
drop   `area_cz` ,
drop   `region_cz`;

ALTER TABLE `_cities` CHANGE COLUMN `title_ru` `title` VARCHAR(100) NULL;


ALTER TABLE `_countries`
drop `title_ua`,
drop `title_be`,
drop `title_en`,
drop `title_es`,
drop `title_pt`,
drop `title_de`,
drop `title_fr`,
drop `title_it`,
drop `title_pl`,
drop `title_ja`,
drop `title_lt`,
drop `title_lv`,
drop `title_cz`;

ALTER TABLE `_countries` CHANGE COLUMN `title_ru` `title` VARCHAR(150) NULL;

ALTER TABLE `_regions`
drop `title_ua`,
drop `title_be`,
drop `title_en`,
drop `title_es`,
drop `title_pt`,
drop `title_de`,
drop `title_fr`,
drop `title_it`,
drop `title_pl`,
drop `title_ja`,
drop `title_lt`,
drop `title_lv`,
drop `title_cz`;

ALTER TABLE `_regions` CHANGE COLUMN `title_ru` `title` VARCHAR(150) NULL;


ALTER TABLE `_countries` CHANGE COLUMN `country_id` `id` INT PRIMARY KEY AUTO_INCREMENT;
ALTER TABLE `_regions` CHANGE COLUMN `region_id` `id` INT PRIMARY KEY AUTO_INCREMENT;
ALTER TABLE `_cities` CHANGE COLUMN `city_id` `id` INT PRIMARY KEY AUTO_INCREMENT;

ALTER TABLE `_cities` ADD CONSTRAINT fk_cities_country_id FOREIGN KEY (`country_id`) REFERENCES `_countries`(`id`),
					  ADD CONSTRAINT fk_cities_region_id FOREIGN KEY (`region_id`) REFERENCES `_regions`(`id`);

ALTER TABLE `_regions` ADD CONSTRAINT fk_regions_country_id FOREIGN KEY (`country_id`) REFERENCES `_countries`(`id`);