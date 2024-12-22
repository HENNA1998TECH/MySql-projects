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
Id int,
Fname VARCHAR(50) NOT NULL,
Lname VARCHAR(50) NOT NULL,
Population VARCHAR(1000),
Rating decimal(3,2),
Country_Id int primary key auto_increment not null,
Country_Name VARCHAR (50) DEFAULT (NULL)
);
desc Persons;
#inserting values 
INSERT INTO Country (Country_Name,Population,Area)
VALUES
('USA','38,889,800','California'),
('USA',	'19,469,200','New York'),
('Canada','6,202,225','Toronto'),
('Canada','4,291,732','Montreal'),
('UK','8,294,058','London'),
('UK','1,741,961','Manchester'),
('Australia','5,207,145','Melbourne'),
('Australia','5,450,496','Sydney'),
('India','1,055,450','Chandigarh'),
('India','33,406,061','Kerala');
SELECT*FROM Country;
INSERT INTO Persons (Id,Fname,Lname,Population,Rating,Country_Name)
VALUES
('1','Noah','Dean','5,207,145','3.5','Australia'),
('2','Liam','Edgar','38,889,800','4.5',DEFAULT),
('3','Ivan','Mariya','1,741,961','5','UK'),
('4','David','Taylor','8,294,058','3','UK'),
('5','Rahul','Mehta','1,055,450','3.5',default),
('6','Ranveer','Meher','1,055,450','4','India'),
('7','Ayra','Malik','33,406,061','5','India'),
('8','Helen','Kelly','6,202,225','4.5','Canada'),
('9','Edward','Owen','38,889,800','3.5','USA'),
('10','Oliver','Max','38,889,800','5','USA');
SELECT*FROM Persons;
#distinct country names from persons table
SELECT DISTINCT Country_Name FROM PERSONS;
#First name and lastname from person table using Aliases
SELECT Fname AS First_Name,Lname AS Last_Name FROM Persons;
#Persons with rating>4.0
SELECT Fname,Lname FROM Persons WHERE Rating>'4.0';
#Countries with a population >10lakhs
SELECT Country_Name FROM Country WHERE Population>'10,00,000';
#persons from USA OR rating>4.5
SELECT Fname,Lname FROM Persons WHERE Country_Name='USA' OR Rating>'4.5';
#Persons where country name is null
SELECT Fname,Lname FROM Persons WHERE Country_Name is null;
#persons from USA,Canada and UK
SELECT Fname,Lname FROM Persons WHERE Country_Name in ('USA','UK','Canada');
#persons not from the countries India and Australia
SELECT Fname,Lname FROM Persons WHERE NOT Country_Name in('India','Australia');
#countries with population between 5lakhs and 20 lakhs
SELECT Country_Name FROM Persons WHERE Population between '5,00,000' AND '20,00,000';
#countries names do not start with C
SELECT Country_Name FROM Country WHERE Country_Name NOT LIKE 'C%';