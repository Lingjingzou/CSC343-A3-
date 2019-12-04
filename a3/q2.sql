DROP VIEW IF EXISTS q2 CASCADE;

create view at_cap as
select rental_ID
from Rental, Property
where Rental.pID = Property.pID and capacity = guests;

create view at_avg_rate as
select avg(rate) as average, count(distinct at_cap.rental_ID) as number
from at_cap, Property_rating
where at_cap.rental_ID = Property_rating.rental_ID;

create view below_cap as
select rental_ID
from Rental, Property
where Rental.pID = Property.pID and capacity > guests;

create view below_avg_rate as
select avg(rate) as average, count(distinct below_cap.rental_ID) as number
from below_cap, Property_rating
where below_cap.rental_ID = Property_rating.rental_ID;

create view q2 as
select *
from at_avg_rate
UNION 
(select avg(rate) as average, count(distinct below_cap.rental_ID) as number
from below_cap, Property_rating
where below_cap.rental_ID = Property_rating.rental_ID);

select * from q2;