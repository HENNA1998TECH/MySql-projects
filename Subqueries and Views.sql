#QUERYING DATA
CREATE DATABASE WORLD_DATABASE;
USE WORLD_DATABASE;
CREATE TABLE Country( 
Id  int auto_increment primary key NOT NULL,
Country_Name VARCHAR(50) DEFAULT (NULL),
Population VARCHAR(1000),
Area VARCHAR (50)
);
desc Country;
#creating table
CREATE TABLE Persons(
Id int primary key auto_increment not null,
Fname VARCHAR(50) NOT NULL,
Lname VARCHAR(50) ,
Population VARCHAR(1000),
Rating decimal(3,2),
Country_Id int not null,
Country_Name VARCHAR (50) DEFAULT (NULL)
);
desc Persons;
#inserting values 
INSERT INTO Country (Country_Name,Population,Area)
VALUES
('USA','38,889,800','California'),
('Africa','218,541,212','Nigeria'),
('Canada','6,202,225','Toronto'),
('China','126,570,000','Guangdong'),
('UK','8,294,058','London'),
('Japan','8,336,599','Tokyo'),
('Australia','5,207,145','Melbourne'),
('Turkey','10,861,463','Istanbul'),
('India','1,055,450','Chandigarh'),
('UAE','3,790,000','Dubai');
SELECT*FROM Country;
INSERT INTO Persons (Fname,Lname,Population,Rating,Country_Id,Country_Name)
VALUES
('Noah','Dean','5,207,145','3.5','7','Australia'),
('Liam','Edgar','126,570,000','4.5','4',DEFAULT),
('Ivan','Mariya','5,207,145','5','7','Australia'),
('David','Taylor','8,294,058','3','5','UK'),
('Rahul','Mehta','10,861,463','3.5','8',default),
('Ranveer','Meher','1,055,450','4','9','India'),
('Ayra','Malik','3,790,000','5','10','UAE'),
('Helen','Kelly','6,202,225','4.5','3','Canada'),
('Edward','Owen','38,889,800','3.5','1','USA'),
('Oliver','Max','3,790,000','5','10','UAE');
SELECT*FROM Persons;

# functions
#add table DOB
ALTER TABLE Persons add(DOB DATE);
UPDATE Persons SET DOB=('1997-05-12') WHERE Id=1;
UPDATE Persons SET DOB=('1995-12-09')WHERE Id=2;
UPDATE Persons SET DOB=('1998-06-13')WHERE Id=3; 
UPDATE Persons SET DOB=('1999-09-08')WHERE Id=4; 
UPDATE Persons SET DOB=('1997-07-05')WHERE Id=5;  
UPDATE Persons SET DOB=('1996-01-01')WHERE Id=6; 
UPDATE Persons SET DOB=('1994-11-12')WHERE Id=7; 
UPDATE Persons SET DOB=('1994-09-07')WHERE Id=8;  
UPDATE Persons SET DOB=('1998-05-11')WHERE Id=9;
UPDATE Persons SET DOB=('1994-02-03')WHERE Id=10;  

#SUBQUERIES AND VIEWS
-- number of persons in each country
SELECT Country_name, COUNT(*) AS No_of_Persons
FROM Persons
GROUP BY Country_name;
-- no of persons in each country sorted from high to low
SELECT Country_name, COUNT(*) AS No_of_Persons
FROM Persons
GROUP BY Country_name
ORDER BY No_of_Persons DESC;
-- average rating for Persons in respective countries if the average is greater than 3.0 
SELECT Country_name, AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;
 -- countries with the same rating as the USA.
SELECT Country_Name
FROM Persons
WHERE Rating = (SELECT Rating FROM Persons WHERE Country_Name ='USA');
-- countries whose population is greater than the average population of all nations
SELECT Country_name, 
Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);

CREATE DATABASE PRODUCT;
USE PRODUCT;
CREATE TABLE Customer(
Customer_Id int  auto_increment primary key,
First_Name VARCHAR(50),
Last_Name VARCHAR (50),
Email VARCHAR(50),
Phone_no VARCHAR(10),
Address VARCHAR(100),
City VARCHAR(50),
State VARCHAR(50),
Zip_Code VARCHAR(10),
Country VARCHAR (50)
);
DESC Customer;
INSERT INTO Customer (First_Name,Last_Name,Email,Phone_no,Address,City,State,Zip_Code,Country)
VALUES 
('Rahul','Krishna','Rahul1990@gmail.com','9878564323', '36cubic_bireleystreet','Preston','Lancashire','PR12AQ','UK'),
('Thomas','Albert','Thomasalbert@gmail.com','7867540987','Trinity village','Blackpool','Lancashire','FY11AN','UK'),
('David','Taylor','Davidtaylor@gmail.com','6578984532','143 lawson street','San Diego','California','91911','USA'),
('Ivan','Mariya','Ivanmariya@gmail.com','8978654325','Broadway','New york','Newyork','WR117HF','USA'),
('Liam','Edgar','liamedgar@gmail.com','7689054631','23 rooms','La Rambla','Barcelona','14540','Spain'),
('Eddie','Milton','Eddiemilton@gmailcom','6789095434','123 sheffield','Royalmile','Edinburgh','EH11QS','Scotland'),
('Sophie','Ingleson','Sophieingleson@gmail.com','9807123456','56 Avenham','Abbey road','London','NW8 9PD','England'),
('Helen','Kelly','helenkelly@gmail.com','9087675434','33 sanford','Queen street','Brisbane','QLD 4000','Australia'),
('Oliver','Max','Olivermax@gmail.com','7890453214','55 Beverley street','Toronto','Toronto','M5T 3L2','Canada'),
('Noah','Dean','Noahdean@gmail.com','7894356098','NIT','Calicut','Kerala','673601','India');

SELECT * FROM Customer;
-- view named customer_info for the Customer table that displays Customer’s Full name and email address.
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;
SELECT * FROM customer_info;
-- Create a view named US_Customers that displays customers located in the USA
CREATE VIEW US_Customers AS
SELECT * FROM Customer
WHERE Country = 'USA';
SELECT * FROM US_Customers;
-- view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
 CREATE VIEW Customer_details AS 
 SELECT CONCAT(First_name,' ',Last_name) AS Full_name,Email,Phone_no,State
 FROM Customer;
 SELECT * FROM Customer_details;
 -- Update phone numbers of customers who live in California for Customer_details view.
 UPDATE Customer
SET Phone_no = '6789045632'
WHERE Customer_Id = 3; 
-- Count the number of customers in each state and show only states with more than 5 customer
SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;
-- the number of customers in each state, based on the "state" column in the "customer_details" view
SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer_details
GROUP BY State;
-- returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
SELECT * 
FROM Customer_details
ORDER BY State ASC;







