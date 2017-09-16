/* пришлось погуглить но как-то так */
SELECT _cities.city_id, _countries.title, _regions.title, _cities.title from _cities
INNER JOIN _countries on _cities.country_id = _countries.country_id
INNER JOIN _regions on _cities.region_id = _regions.region_id
WHERE _cities.title ="Курск";
/*просто чтобы узнать city_id */
SELECT * FROM _regions WHERE title LIKE '%моск%';
/* собственно вся Московская область =) */
SELECT *  FROM _cities WHERE _cities.region_id = 1053480;
/* Прошу прощения, но вторую часть ДЗ с базой  "Сотрудники" я просто физически не успеваю сдать вовремя (прием ДЗ окончится в 10:00 по МСК) из-за загруженности на работе в пятницу и перноса занятия */