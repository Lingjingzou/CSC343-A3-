
DROP VIEW if EXISTS not_other_prop CASCADE;
create view not_other_prop as
select p1.pID 
from Property p1, WaterProperty w1, CityProperty c1
where p1.pID = w1.pID or p1.pID = c1.pID;

DROP VIEW if EXISTS other_prop CASCADE;
create view other_prop as
select p1.pID 
from Property p1 except(select p1.pID 
from Property p1, WaterProperty w1, CityProperty c1
where p1.pID = w1.pID or p1.pID = c1.pID);

DROP VIEW if EXISTS city_avg CASCADE;
create view city_avg as
select avg(guests - 1 ) as city_avg
from Rental, CityProperty
where Rental.pID = CityProperty.pID;

DROP VIEW if EXISTS water_avg CASCADE;
create view water_avg as
select avg(guests - 1 ) as water_avg
from Rental, WaterProperty
where Rental.pID = WaterProperty.pID;


DROP VIEW if EXISTS other_avg CASCADE;
create view other_avg as
select avg(guests - 1 ) as other_avg
from Rental, other_prop
where Rental.pID = other_prop.pID;

select city_avg as city_avg_guests, water_avg as water_avg_guests, other_avg as other_avg_guests
from city_avg, water_avg, other_avg;