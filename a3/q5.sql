
DROP VIEW IF EXISTS not_rented CASCADE;
create view not_rented as
select pID, 0 as price
from Property 
EXCEPT(select pID, 0 as price from Rental_week_price);


DROP VIEW IF EXISTS full_table CASCADE;
create view full_table as
select pID, price
from not_rented 
UNION(select pID, price from Rental_week_price)
order by pID;


DROP VIEW IF EXISTS highest_price CASCADE;
create view highest_price as
select pID, max(price) as high
from full_table p
group by pID;


DROP VIEW IF EXISTS lowest_price CASCADE;
create view lowest_price as
select pID, min(price) as low
from full_table p
group by pID;


DROP VIEW IF EXISTS range CASCADE;
create view range as
select h.pID, (high - low) as range
from highest_price h, lowest_price l
where h.pID = l.pID
group by h.pID, range;



DROP VIEW IF EXISTS not_highest CASCADE;
create view not_highest as
select distinct r1.pID
from range r1, range r2
where r1.range < r2.range;



DROP VIEW IF EXISTS highest CASCADE;
create view highest as
select distinct pID
from range 
EXCEPT(select pID from not_highest);



DROP VIEW IF EXISTS no_star CASCADE;
create view no_star as
select l.pID, high, low, range, null as star
from lowest_price l, highest_price h, range r, not_highest n
where l.pID = h.pID and
    h.pID = r.pID and
    r.pID = n.pID;


DROP VIEW IF EXISTS with_star CASCADE;
create view with_star as
select l.pID, high, low, range, '*' as star
from lowest_price l, highest_price h, range r, highest n
where l.pID = h.pID and
    h.pID = r.pID and
    r.pID = n.pID;



DROP VIEW IF EXISTS answer CASCADE;
create view answer as
select *
from no_star
UNION (select l.pID, high, low, range, '*' as star
from lowest_price l, highest_price h, range r, highest n
where l.pID = h.pID and
    h.pID = r.pID and
    r.pID = n.pID)
order by pID;


select * from answer;