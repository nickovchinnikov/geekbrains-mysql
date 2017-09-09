# 1 TASK
use world;

create view city_info as select city.name as city, country.Name as country, region.Name as region 
from city left join (country, region)
on (country.ID = city.CoutryID and region.id = city.RegionID) 
where city.IsDeleted = 0 and region.IsDeleted = 0 and country.IsDeleted = 0;

create view moscow_region as select region.Name as region, city.ID as city 
from region left join city on city.RegionID = region.ID 
where region.name = 'Moscow';