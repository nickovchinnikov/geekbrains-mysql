use geodata;
select _cities.title as city ,
	_countries.title as country,
	_regions.title as region	
from _cities
	left join _countries 
    on _cities.country_id = _countries.country_id
    left join _regions
    on _cities.region_id = _regions.region_id
   where _cities.title = 'Москва' ;
    