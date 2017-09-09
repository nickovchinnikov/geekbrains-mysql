ALTER TABLE `world`.`country` 
DROP FOREIGN KEY `fk_capital`;
ALTER TABLE `world`.`country` 
DROP COLUMN `IsDeleted`,
DROP COLUMN `DateUpdate`,
DROP COLUMN `Population`,
DROP COLUMN `Langudge`,
DROP COLUMN `CapitalCity`,
DROP COLUMN `Founded`,
DROP COLUMN `TextCode`,
DROP COLUMN `NumCode`,
CHANGE COLUMN `ID` `id` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `Name` `title` VARCHAR(150) NOT NULL COMMENT '\nInternational name' ,
DROP INDEX `fk_capital_idx` ,
DROP INDEX `TextCode_UNIQUE` ,
DROP INDEX `NumCode_UNIQUE` ;

ALTER TABLE `world`.`region` 
DROP FOREIGN KEY `fk_country`,
DROP FOREIGN KEY `fk_adm_center`;
ALTER TABLE `world`.`region` 
DROP COLUMN `IsDeleted`,
DROP COLUMN `DateUpdate`,
DROP COLUMN `Population`,
DROP COLUMN `AdmCenter`,
DROP COLUMN `NumCode`,
DROP COLUMN `TextCode`,
CHANGE COLUMN `ID` `id` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `CountryID` `сountry_id` INT NOT NULL COMMENT '\nA foreign key identifying the country from the \"country\" table' ,
CHANGE COLUMN `Name` `title` VARCHAR(150) NOT NULL ,
DROP INDEX `fk_adm_center_idx` ,
DROP INDEX `NumCode_UNIQUE` ,
DROP INDEX `TextCode_UNIQUE` ;
ALTER TABLE `world`.`region` 
ADD CONSTRAINT `fk_country`
  FOREIGN KEY (`сountry_id`)
  REFERENCES `world`.`country` (`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `world`.`city` 
DROP FOREIGN KEY `fk_country2`,
DROP FOREIGN KEY `fk_region1`,
DROP FOREIGN KEY `fk_area`;
ALTER TABLE `world`.`city` 
DROP COLUMN `DateUpdate`,
DROP COLUMN `Population`,
DROP COLUMN `AreaID`,
CHANGE COLUMN `ID` `id` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `CoutryID` `coutry_id` INT NOT NULL COMMENT 'A foreign key identifying the country from the \"country\" table' ,
CHANGE COLUMN `RegionID` `region_id` INT NOT NULL COMMENT 'A foreign key identifying the region from the \"region\" table' ,
CHANGE COLUMN ` Name` `title` VARCHAR(150) NOT NULL ,
CHANGE COLUMN `IsDeleted` `important` TINYINT(1) NOT NULL ,
DROP INDEX `fk_area_idx` ;
ALTER TABLE `world`.`city` 
ADD CONSTRAINT `fk_country2`
  FOREIGN KEY (`coutry_id`)
  REFERENCES `world`.`country` (`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_region1`
  FOREIGN KEY (`region_id`)
  REFERENCES `world`.`region` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

drop table `world`.`area`