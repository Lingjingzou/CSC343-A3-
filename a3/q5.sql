DROP VIEW IF EXISTS  CASCADE;




create view not_rented as
select pID, 0 as price
from Property 
EXCEPT(select pID, 0 as price from Rental_week_price);


create view full_table as
select pID, price
from not_rented, Rental_week_price

DROP VIEW IF EXISTS highest_price CASCADE;
create view highest_price as
select r.pID, max(p.price)
from full_table p, Rental_week_price r
where p.pID = r.pID
group by r.pID;


DROP VIEW IF EXISTS lowest_price CASCADE;
create view lowest_price as
select r.pID, min(price)
from full_table p, Rental_week_price r
where p.pID = r.pID
group by r.pID;


DROP VIEW IF EXISTS range CASCADE;
create view range as
