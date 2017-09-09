USE `geodata`

SELECT `ci`.`title` `город`, `r`.`title` `регион`, `co`.`title` `страна`
  FROM `_cities` `ci`
  LEFT JOIN `_regions` `r`
    ON `r`.`id` = `ci`.`region_id`
  LEFT JOIN `_countries` `co`
    ON `co`.`id` = `ci`.`country_id`
LIMIT 5;

SELECT `ci`.`title` `город`, `r`.`title` `регион`
  FROM `_cities` `ci`
  LEFT JOIN `_regions` `r`
    ON `r`.`id` = `ci`.`region_id`
WHERE `r`.`title` = "Московская область"
LIMIT 5;

USE `employess`;

SELECT  `d`.*, AVG(`s`.`salary`) `average`
  FROM `departments` `d`
  LEFT JOIN `dept_emp` `de`
    ON `de`.`dept_no` = `d`.`dept_no`
  LEFT JOIN `employees` `e`
    ON `e`.`emp_no` = `de`.`emp_no`
  LEFT JOIN `salaries` `s`
    ON `s`.`emp_no` = `de`.`emp_no`
  GROUP BY `d`.`dept_no`
  LIMIT 10;

SELECT  `d`.*, CONCAT(`e`.`first_name`, " ", `e`.`last_name`) `manager_name`, AVG(`s`.`salary`) `average`
  FROM `departments` `d`
  LEFT JOIN `dept_manager` `m`
    ON `m`.`dept_no` = `d`.`dept_no`
  LEFT JOIN `employees` `e`
    ON `e`.`emp_no` = `m`.`emp_no`
  LEFT JOIN `salaries` `s`
    ON `s`.`emp_no` = `m`.`emp_no`
  GROUP BY `d`.`dept_no`
  LIMIT 10;

  // остальное не успелось ...
