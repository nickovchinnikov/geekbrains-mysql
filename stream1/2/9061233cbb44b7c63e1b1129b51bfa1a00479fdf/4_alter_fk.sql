use geodata;

alter table _cities
add constraint `fk_country` foreign key  (country_id) references `_countries` (country_id) on delete cascade,
add constraint `fk_region`  foreign key (region_id) references `_regions` (region_id) on delete cascade;

alter table _regions
add constraint `fk_country_reg` foreign key  (country_id) references `_countries` (country_id) on delete cascade;