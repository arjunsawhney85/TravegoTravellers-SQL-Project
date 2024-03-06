-- Travego Travellers 

#Creating Database, Tables and inserting records.

CREATE DATABASE TRAVEGO;
USE TRAVEGO;

CREATE TABLE passenger(
Passenger_id INT PRIMARY KEY,
Passenger_name VARCHAR(20),
Category VARCHAR(20),
Gender VARCHAR(20),
Boarding_City VARCHAR(20),
Destination_City VARCHAR(20),
Distance INT,
Bus_Type VARCHAR(20)
);

CREATE TABLE price(
id INT PRIMARY KEY,
Bus_Type VARCHAR(20),
Distance INT,
Price INT
);
INSERT INTO passenger VALUES
(1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
(2,'Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
(3,'Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
(4,'Khushboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
(5,'Udit','Non-AC','M','Trivandrum','Panaji',1000 ,'Sleeper'),
(6,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
(7,'Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
(8,'Manish','Non-AC','M','Hederabad','Bengaluru',500,'Sitting'),
(9,'Piyush','AC','M','Pune','Nagpur',700,'Sitting');   

INSERT INTO price VALUES
(1,'Sleeper',350,770),
(2,'Sleeper',500,1100),
(3,'Sleeper',600,1320),
(4,'Sleeper',700,1540),
(5,'Sleeper',1000,2200),
(6,'Sleeper',1200,2640),
(7,'Sleeper',1500,2700),
(8,'Sitting',500,620),
(9,'Sitting',600,744),
(10,'Sitting',700,868),
(11,'Sitting',1000,1240),
(12,'Sitting',1200,1488),
(13,'Sitting',1500,1860);



USE TRAVEGO;

# a.How many female passengers traveled a minimum distance of 600KMs?
SELECT COUNT(*) AS cnt
FROM passenger 
WHERE Gender = 'F' AND Distance >=600;

# b.Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus.
SELECT * 
FROM passenger 
WHERE Distance>500 AND Bus_Type='Sleeper';

# c. Select passenger names whose names start with the character 'S'.
SELECT * 
FROM passenger 
WHERE Passenger_name 
LIKE 'S%';

# d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City, Destination City, Bus type, and Price in the output.
SELECT passenger.Passenger_name,passenger.Boarding_City,passenger.Destination_City,passenger.Bus_Type,price.Price 
FROM passenger,price 
WHERE passenger.Distance = price.Distance;

# e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?
SELECT passenger.Passenger_name , price.Price 
FROM passenger , price
WHERE passenger.Distance >= 1000 AND passenger.Bus_Type='Sitting' 
AND passenger.Distance = price.Distance;

# f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
SELECT price.Bus_Type ,price.Price 
from passenger,price 
WHERE passenger.Passenger_name='Pallavi' 
AND passenger.Distance=price.Distance;

# g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper.
SELECT * FROM passenger;
UPDATE passenger SET Category = 'Non-AC' WHERE Bus_Type='Sleeper' ;
SELECT * FROM passenger;

# h. Delete an entry from the table where the passenger name is Piyush and commit this change in the database.
DELETE FROM passenger WHERE Passenger_name='Piyush';
COMMIT;

# i. Truncate the table passenger and comment on the number of rows in the table (explain if required).
TRUNCATE TABLE passenger; -- Trunacte deletes all the row data only table defination remains same.
SELECT * FROM passenger;

# j. Delete the table passenger from the database.
DROP TABLE passenger;