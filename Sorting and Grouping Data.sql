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
Lname VARCHAR(50) ,
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
INSERT INTO Persons (Id,Fname,Lname,Population,Rating,Country_Name)
VALUES
('1','Noah','Dean','5,207,145','3.5','Australia'),
('2','Liam','Edgar','126,570,000','4.5',DEFAULT),
('3','Ivan','Mariya','5,207,145','5','Australia'),
('4','David','Taylor','8,294,058','3','UK'),
('5','Rahul','Mehta','10,861,463','3.5',default),
('6','Ranveer','Meher','1,055,450','4','India'),
('7','Ayra','Malik','3,790,000','5','UAE'),
('8','Helen','Kelly','6,202,225','4.5','Canada'),
('9','Edward','Owen','38,889,800','3.5','USA'),
('10','Oliver','Max','3,790,000','5','UAE');
SELECT*FROM Persons;
#3 characters from country_name
SELECT SUBSTRING(Country_Name,1,3) FROM Country;
#Concatenate fname anh lname from person table
SELECT CONCAT(Fname,Lname) FROM Persons;
#Count the number of unique countrynames from persons table
SELECT COUNT(DISTINCT Country_Name) FROM Persons;
#Maximum population from Country table
SELECT MAX(Population) FROM Country;
#Minimum population  from Persons table
SELECT MIN(Population) FROM Persons;
#Inserting Rows to the Persons table 
ALTER TABLE Persons MODIFY Lname VARCHAR(50)NULL; 
INSERT INTO Persons(Id,Fname,Lname,Population,Rating,Country_Name)
VALUES ('11','Eddie',default,'38,889,800','4.0','USA'),
('12','Jacob',default,'8,336,599','5.0','Japan');
SELECT COUNT(Lname) FROM Persons;
SELECT*FROM Persons;
#No of rows in persons table
SELECT COUNT(*) FROM Persons;
#first 3 rows of polpulation in country table
SELECT Population FROM Country LIMIT 3;
#Print 3 random rows of countries
SELECT Country_Name FROM Country ORDER BY RAND() LIMIT 3;
#list all persons rating in descending order
SELECT Fname FROM Persons ORDER BY Rating DESC;
SELECT * FROM Persons ORDER BY Rating DESC;
#Total population in country from persons table
SELECT SUM(Population) as TotalPopulation  FROM Persons WHERE Country_Name='UAE';
#countries with total population >50,000 from persons table
SELECT Country_Name FROM Persons WHERE Population>'50,000';
#Total no of person in persons table
SELECT COUNT(Fname) as totalnoofpersons FROM Persons;
#Average Rating of each countries
SELECT Country_Name, AVG(Rating) AS Averagerating FROM Persons WHERE Country_Name IN (SELECT Country_Name 
FROM Persons) 
GROUP BY Country_Name 
HAVING COUNT(Country_Name)>=2
ORDER BY Averagerating ASC;




