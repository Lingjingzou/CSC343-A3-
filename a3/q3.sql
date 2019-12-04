
DROP VIEW if EXISTS average_rate CASCADE;
create view average_rate as
select avg(rate) as average, hID
from Host_rating
group by hID;


DROP VIEW if EXISTS not_highest CASCADE;
create view not_highest as
select a1.hID
from average a1, average a2
where a1.average < a2.average;


DROP VIEW if EXISTS all_hID CASCADE;
create view all_hID as
select hID
from Host_rating;

DROP VIEW if EXISTS highest_host CASCADE;
create view highest_host as
select hID
from all_hID 
    EXCEPT(select a1.hID
from average a1, average a2
where a1.average < a2.average);

DROP VIEW if EXISTS highest_price CASCADE;
create view highest_price as
select h2.hID, max(price) as price
from Rental_week_price r1, highest_host h2
where r1.hID = h2.hID
group by h2.hID;

DROP VIEW if EXISTS answer CASCADE;
create view answer as
select h1.hID, email_address, average, price
from Host, highest_price h1, average_rate a1
where Host.hID = h1.hID and 
    h1.hID = a1.hID;


select * from answer;