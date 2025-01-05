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
INSERT INTO Persons (Id,Fname,Lname,Population,Rating,Country_Id,Country_Name)
VALUES
('1','Noah','Dean','5,207,145','3.5','7','Australia'),
('2','Liam','Edgar','126,570,000','4.5','4',DEFAULT),
('3','Ivan','Mariya','5,207,145','5','7','Australia'),
('4','David','Taylor','8,294,058','3','5','UK'),
('5','Rahul','Mehta','10,861,463','3.5','8',default),
('6','Ranveer','Meher','1,055,450','4','9','India'),
('7','Ayra','Malik','3,790,000','5','10','UAE'),
('8','Helen','Kelly','6,202,225','4.5','3','Canada'),
('9','Edward','Owen','38,889,800','3.5','1','USA'),
('10','Oliver','Max','3,790,000','5','10','UAE');
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

 #user defined functions
#calculating age using dob
 DELIMITER $$
 CREATE FUNCTION Age (DOB DATE)
 RETURNS INT
 DETERMINISTIC
 BEGIN
 DECLARE Age INT;
 SET Age = Year(curdate())-Year(DOB);
 RETURN Age;
 END $$
 #fetch all ages of persons in persons table
 SELECT Age(DOB) FROM Persons;
 #length of country name in country table
 SELECT length( Country_Name) as Length,Country_Name FROM Country;
 #first 3 characters of country name in country table
 SELECT SUBSTRING(Country_Name,1,3) FROM Country;
 #country name in upper case in country table
 SELECT UPPER(Country_Name) AS Uppercase_Country from Country;
 #country name in lower case in country table
 SELECT LOWER(Country_Name) AS Lowercase_Country FROM Country;
 






