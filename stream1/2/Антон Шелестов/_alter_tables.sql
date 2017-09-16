use geodata;
ALTER TABLE _countries
  CHANGE country_id id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  CHANGE title_ru title VARCHAR(150) NOT NULL,
  ADD PRIMARY KEY (id),
  ADD UNIQUE INDEX id_UNIQUE (id ASC),
  ADD INDEX title_INDEX (title ASC),
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

ALTER TABLE _regions
  CHANGE region_id id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  CHANGE title_ru title VARCHAR(150) NOT NULL,
  MODIFY COLUMN country_id INT UNSIGNED,
  ADD PRIMARY KEY (id),
  ADD UNIQUE INDEX id_UNIQUE (id ASC),
  ADD INDEX title_INDEX (title ASC),
  ADD INDEX fk_region_country_idx (country_id ASC),
  ADD CONSTRAINT fk_region_country
FOREIGN KEY (country_id)
REFERENCES _countries (id)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
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


ALTER TABLE _cities
  CHANGE city_id id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  CHANGE title_ru title VARCHAR(150) NOT NULL,
  MODIFY COLUMN country_id INT UNSIGNED,
  MODIFY COLUMN region_id INT UNSIGNED,

  ADD PRIMARY KEY (id),
  ADD UNIQUE INDEX id_UNIQUE (id ASC),

  ADD INDEX title_INDEX (title ASC),
  ADD INDEX fk_city_country_idx (country_id ASC),
  ADD INDEX fk_city_region_idx (region_id ASC),

  ADD CONSTRAINT fk_city_country
FOREIGN KEY (country_id)
REFERENCES _countries (id)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,

  ADD CONSTRAINT fk_city_region
FOREIGN KEY (region_id)
REFERENCES _regions (id)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,

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
  DROP title_cz,

  DROP area_ru,
  DROP area_ua,
  DROP area_be,
  DROP area_en,
  DROP area_es,
  DROP area_pt,
  DROP area_de,
  DROP area_fr,
  DROP area_it,
  DROP area_pl,
  DROP area_ja,
  DROP area_lt,
  DROP area_lv,
  DROP area_cz,

  DROP region_ru,
  DROP region_ua,
  DROP region_be,
  DROP region_en,
  DROP region_es,
  DROP region_pt,
  DROP region_de,
  DROP region_fr,
  DROP region_it,
  DROP region_pl,
  DROP region_ja,
  DROP region_lt,
  DROP region_lv,
  DROP region_cz;