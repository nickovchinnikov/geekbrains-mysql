-- -------------------------------- --
-- DB_Lesson2 - Timur Umarov © 2017 --
-- -------------------------------- --

-- ------------------------- --
-- Modify `_countries` table --
-- ------------------------- --
ALTER TABLE geodata.`_countries` 
  DROP title_ua,
  DROP title_be,
  DROP title_en,
  DROP title_es,
  DROP title_pt,
  DROP title_de,
  DROP title_fr,
  DROP title_it,
  DROP title_pl,
  DROP title_ja,
  DROP title_lt,
  DROP title_lv,
  DROP title_cz;

ALTER TABLE geodata.`_countries` CHANGE country_id id INT NOT NULL;
ALTER TABLE geodata.`_countries` ADD PRIMARY KEY (id);
ALTER TABLE geodata.`_countries` MODIFY id INT AUTO_INCREMENT;

ALTER TABLE geodata.`_countries` CHANGE title_ru title VARCHAR(150) NOT NULL;
CREATE INDEX `_countries_title_index` ON geodata.`_countries` (title);


-- ----------------------- --
-- Modify `_regions` table --
-- ----------------------- --
ALTER TABLE geodata.`_regions`
  DROP title_ua,
  DROP title_be,
  DROP title_en,
  DROP title_es,
  DROP title_pt,
  DROP title_de,
  DROP title_fr,
  DROP title_it,
  DROP title_pl,
  DROP title_ja,
  DROP title_lt,
  DROP title_lv,
  DROP title_cz;

ALTER TABLE geodata.`_regions` CHANGE region_id id INT NOT NULL;
ALTER TABLE geodata.`_regions` ADD PRIMARY KEY (id);
ALTER TABLE geodata.`_regions` MODIFY id INT AUTO_INCREMENT;

ALTER TABLE geodata.`_regions` CHANGE title_ru title VARCHAR(150) NOT NULL;
CREATE INDEX `_regions_title_index` ON geodata.`_regions` (title);


-- ---------------------- --
-- Modify `_cities` table --
-- ---------------------- --
ALTER TABLE geodata.`_cities` 
  DROP area_ru,
  DROP region_ru,
  DROP title_ua,
  DROP area_ua,
  DROP region_ua,
  DROP title_be,
  DROP area_be,
  DROP region_be,
  DROP title_en,
  DROP area_en,
  DROP region_en,
  DROP title_es,
  DROP area_es,
  DROP region_es,
  DROP title_pt,
  DROP area_pt,
  DROP region_pt,
  DROP title_de,
  DROP area_de,
  DROP region_de,
  DROP title_fr,
  DROP area_fr,
  DROP region_fr,
  DROP title_it,
  DROP area_it,
  DROP region_it,
  DROP title_pl,
  DROP area_pl,
  DROP region_pl,
  DROP title_ja,
  DROP area_ja,
  DROP region_ja,
  DROP title_lt,
  DROP area_lt,
  DROP region_lt,
  DROP title_lv,
  DROP area_lv,
  DROP region_lv,
  DROP title_cz,
  DROP area_cz,
  DROP region_cz;

ALTER TABLE geodata.`_cities` CHANGE city_id id INT NOT NULL;
ALTER TABLE geodata.`_cities` ADD PRIMARY KEY (id);
ALTER TABLE geodata.`_cities` MODIFY id INT AUTO_INCREMENT;

ALTER TABLE geodata.`_cities` CHANGE title_ru title VARCHAR(150);
CREATE INDEX `_cities_title_index` ON geodata.`_cities` (title);


-- ---------------------------- --
-- Add foreign keys for _cities --
-- ---------------------------- --
ALTER TABLE geodata.`_cities`
  ADD CONSTRAINT `_cities__countries_id_fk`
FOREIGN KEY (country_id) REFERENCES `_countries` (id);
ALTER TABLE geodata.`_cities`
  ADD CONSTRAINT `_cities__regions_id_fk`
FOREIGN KEY (region_id) REFERENCES `_regions` (id);


-- ----------------------------- --
-- Add foreign keys for _regions --
-- ----------------------------- --
ALTER TABLE geodata.`_regions`
  ADD CONSTRAINT `_regions__countries_id_fk`
FOREIGN KEY (country_id) REFERENCES `_countries` (id);

