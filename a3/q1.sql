Drop view if EXISTS q1 CASCADE;

create view q1 as
select count(pID) as number, luxurys
from Luxury
group by luxurys;

select * from q1;