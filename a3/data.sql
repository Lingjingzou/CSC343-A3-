INSERT INTO Property VALUES
(1, 'Tatooine', 6, 3, 1),
(2, 'Alderaan', 2, 1, 1),
(3, 'Corellia', 3, 2, 1),
(4, 'Verona', 2, 2, 1),
(5, 'Florence', 4, 2, 2),
(6, null, 2, 1, 1);

INSERT INTO WaterProperty VALUES
(2, 'lake', false);

INSERT INTO CityProperty VALUES
(3, 20, 'bus');


INSERT INTO Host VALUES
(1,'luke@gmail.com'),
(2,'leia@gmail.com'),
(3,'han@gmail.com');


--INSERT INTO Luxury VALUES
--(1, true, false, false, true, false, false),
--(2, true, true, false, true, false,false),
--(3, false, false, false, false, true, true),
--(4, false, false, true, false,false, false),
--(5, true, false, true, false,false, false),
--(6, true, true, true, true,false, true);

INSERT INTO Luxury VALUES
(1, 'hot_tub'),
(1, 'daily_cleaning'),
(2, 'hot_tub'),
(2, 'sauna'),
(2, 'daily_cleaning'),
(3, 'daily_breakfast'),
(3, 'concierge_service'),
(4, 'laundry_service'),
(5, 'hot_tub'),
(5, 'laundry_service'),
(6, 'hot_tub'),
(6, 'sauna'),
(6, 'laundry_service'),
(6, 'daily_cleaning');


INSERT INTO Guest VALUES
-- gID, name, address, birthday
(1, 'Leia, Princess', 'Alderaan', '2001-10-05'),
(2, 'Darth Vader', 'Death Star','1985-12-06'),
(3, 'Romeo Montague', 'Verona', '1988-05-11'),
(4, 'Juliet Capulet', 'Verona','1991-07-24'),
(5, 'Mercutio', 'Verona','1988-03-03'),
(6, 'Chewbacca', 'Kashyyyk', '1998-09-15');

INSERT INTO Renter VALUES
(2, 3466704824219330),
(1, 6011253896008199),
(3, 5446447451075463),
(5, 4666153163329984),
(6, 6011624297465933);


INSERT INTO Rental VALUES
--rental, pID, rID ,date ,duration, guests
(1, 2, 2, '2019-01-05', 1, 2),
(2, 3, 1, '2019-01-12', 2, 3),
(3, 2, 3, '2019-01-12', 1, 2),
(4, 5, 5, '2019-01-05', 1, 3),
(5, 5, 6, '2019-01-12', 1, 2);

INSERT INTO Visit_table VALUES
--rental, gID
(1, 1),
(2, 3),
(2, 4),
(3, 4),
(4, 2),
(4, 3),
(5, 1);

INSERT INTO Rental_week_price VALUES
--rental, pID, hID, startdate, price
(1, 2, 2,'2019-01-05', 580),
(2, 3, 3,'2019-01-12', 750),
(2, 3, 3,'2019-01-19', 750),
(3, 2, 2,'2019-01-12', 600),
(4, 5, 3,'2019-01-05', 1000),
(5, 5, 3,'2019-01-12', 1220);

INSERT INTO Property_rating VALUES
--rental, gID, rate
(1, 1, 5),
(1, 2, 2),
(2, 3, 5),
(2, 4, 5),
(2, 1, 1),
(3, 4, 5),
(4, 3, 1),
(4, 5, 1),
(5, 6, 3);

INSERT INTO Host_rating VALUES
--hID, rID, rate
(2, 2, 2),
(3 ,1, 5),
(2, 3, 3),
(3, 5, 4),
(3 ,6, 4);

INSERT INTO Comments VALUES
--rental, gID, info
(2, 'Looks like she hides rebel scum here.'),
(1, 'A bit scruffy, could do with more regular housekeeping'),
(6, 'Fantastic, arggg');


INSERT INTO Ownership VALUES
(1, 1),
(6, 1),
(2, 2),
(4, 2),
(3, 3),
(5, 3);

