--This schema is for a vacation rental application.
-- In this schema, these constraints could not be enforced.
--1\ We can not enforce the start day of a week be Saturday because we cannot check if the
--   date of any reantal is Saturday or not in our schema


-- And the following constaints could have been enforced were not enfored.
--1\ The number of guests must not exceed the sleeping capacity of the property, we 
--   need to use the trigger to enforce this constraint as we need the value from two 
--   distinct table and check if we exceed the capacity or not every time we have new
--   guest or insert one more guest to a rental.
--2\ The adress of property should be not null, but the data we are given
--   has the propertu without adress so we have to allow null for adress


DROP SCHEMA IF EXISTS vacationschema CASCADE;
CREATE SCHEMA vacationschema;
set SEARCH_PATH to vacationschema;


create table Property(
    pID INT PRIMARY KEY,
    address varchar(30),
    capacity INT NOT NULL,
    CHECK(capacity >= bedrooms),
    bedrooms INT NOT NULL,
    bathrooms INT NOT NULL
);


create table WaterProperty(
    pID INT references Property(pID) NOT NULL,
    --Water type of each property
    kind varchar(5) NOT NULL,
    --Weather it provides lifeguards
    safety BOOLEAN NOT NULL,
    PRIMARY KEY(pID, kind)
);



create table CityProperty(
    pID INT PRIMARY KEY references Property(pID),
    walkability INT NOT NULL,
    CHECK(walkability >= 0 and walkability <=100),
    traffic varchar(10) NOT NULL
);


create table Host(
    hID INT PRIMARY KEY,
    email_address varchar(30) NOT NULL
);


--create table Luxury(
    --pID INT references Property(pID) PRIMARY KEY,
    --hot_tub BOOLEAN NOT NULL,
    --sauna BOOLEAN NOT NULL,
    --laundry_service BOOLEAN NOT NULL,
    --daily_cleaning BOOLEAN NOT NULL,
    --daily_breakfast BOOLEAN NOT NULL,
    --concierge_service BOOLEAN NOT NULL
--);


create table Luxury(
    pID INT NOT NULL references Property(pID),
    luxurys varchar(25),
    PRIMARY KEY(pID, luxurys)
);


create table Guest(
    gID INT PRIMARY KEY,
    name varchar(20) NOT NULL,
    address varchar(30),
    dob DATE
);


create table Renter(
    rID INT references Guest(gID) PRIMARY KEY,
    credit_card_num BIGINT NOT NULL
);


create table Visit_table(
    rental_ID INT NOT NULL,
    --rID INT references Renter(rID) NOT NULL,
    --visit_date DATE references Rental(start_date) NOT NULL,
    gID INT references Guest(gID) NOT NULL,
    PRIMARY KEY(rental_ID, gID)
);


create table Rental(
    rental_ID INT PRIMARY KEY,
    pID INT references Property(pID) NOT NULL,
    rID INT references Renter(rID) NOT NULL,
    start_date DATE NOT NULL,
    --number of weeks
    duration INT NOT NULL,
    guests INT NOT NULL
);

create table Rental_week_price(
    rental_ID INT references Rental(rental_ID) NOT NULL,
    pID INT references Property(pID) NOT NULL,
    hID INT references Host(hID) NOT NULL,
    start_date DATE NOT NULL,
    price INT NOT NULL,
    PRIMARY KEY(rental_ID, start_date)
);


create table Property_rating(
    rental_ID INT NOT NULL references Rental(rental_ID),
    gID INT NOT NULL references Guest(gID),
    --pID INT NOT NULL,
    rate INT NOT NULL,
    CHECK(rate >= 0 and rate <= 5),
    PRIMARY KEY(rental_ID, gID)
);



create table Host_rating(
    hID INT NOT NULL references Host(hID),
    rID INT NOT NULL references Renter(rID),
    rate INT NOT NULL,
    CHECK(rate >= 0 and rate <= 5),
    PRIMARY KEY(hID, rID)
);


create table Comments(
    --rental_ID INT NOT NULL references Property_rating(rental_ID),
    --gID INT PRIMARY KEY references Property_rating(gID),
    gID INT PRIMARY KEY,
    info varchar(255) NOT NULL
);


create table Ownership(
    pID INT PRIMARY KEY references Property(pID),
    hID INT references Host(hID) NOT NULL
);

