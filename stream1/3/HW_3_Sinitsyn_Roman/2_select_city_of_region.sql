use geodata;
select _cities.title as city ,
		_regions.title as region	
from _cities
    right join _regions
    on _cities.region_id = _regions.region_id
   where _regions.title = 'Московская область' 
   /*limit 10*/;