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

#JOINS AND UNION
#INNERJOIN
SELECT c.Country_Name,c.Population,c.Area,p.Fname,p.Lname,p.Country_Id,p.Rating FROM Country c
INNER JOIN
Persons p ON c.Id = p.Id;
#LEFT JOIN
SELECT c.Country_Name,c.Population,c.Area,p.Fname,p.Lname,p.Country_Id,p.Rating FROM Country c
LEFT JOIN
Persons p ON c.Id = p.Id;
#RIGHT JOIN
 SELECT c.Country_Name,c.Population,c.Area,p.Fname,p.Lname,p.Country_Id,p.Rating FROM Country c
RIGHT JOIN
Persons p ON c.Id = p.Id;

#Distinct country names from persons and country table
SELECT Country_Name FROM Country 
UNION
SELECT Country_Name FROM Persons;

#all country names from persons and country table
SELECT Country_Name FROM Persons 
UNION ALL
SELECT Country_Name FROM Country;

#Round Ratings of all persons
SELECT Fname,Lname, ROUND(Rating,1) as Rounded_Rating FROM Persons;




