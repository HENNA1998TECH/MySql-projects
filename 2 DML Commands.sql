#DDL COMMANDS
CREATE DATABASE EMPLOYEES;
USE EMPLOYEES;
CREATE TABLE Managers(
Manager_Id INT auto_increment primary key,
First_Name VARCHAR(50) NOT NULL,
Last_Name varchar(50)not null,
Date_Of_Birth date NOT NULL,
Age int check (Age >18),
Gender char(1) check (gender in ('M','F','O')),
Department varchar(10) NOT NULL,
Salary decimal(10,2) check (Salary >0)
);
DESC Managers;
INSERT INTO Managers (First_Name,Last_Name,Date_Of_Birth,Age,Gender,Department,Salary)
VALUES
('John','Patrick','1996-05-12','28','M','IT','30000'),
('Aaliya','Mehrin','1997-12-09','27','F','Sales','45000'),
('Helen','Sullivan','1998-07-06','26','F','Finance','50000'),
('Laura','Ingelson','1994-12-04','30','F','IT','25000'),
('David','Taylor','1993-09-23','31','M','Health','30000'),
('Adam','Zahin','1999-11-09','25','M','HR','70000'),
('Eddie','John','1995-09-07','29','M','IT','40000'),
('Maria','David','1996-11-07','28','F','Sales','35000'),
('Jimmy','Mohan','1998-12-16','26','O','Health','10000'),
('Anna','John','1997-12-20','27','F','Finance','20000');
SELECT * FROM Managers;
ALTER TABLE Managers
ADD CONSTRAINT Last_Update CHECK (Salary>=10000);
SELECT First_Name,Last_Name,Date_Of_Birth FROM Managers WHERE Manager_Id='6';
#ANNUAL INCOME OF MANAGERS
SELECT (salary) * 12 from Managers;
#Manager details except Aaliya
SELECT * FROM Managers WHERE Manager_Id !=2;
SELECT * FROM Managers;
#Details of managers whose deparment is IT and earns more than 25000 per month
SELECT * FROM Managers WHERE Salary >25000 AND Department='IT';
#Details of Managers whose salary between 10000 and 35000
SELECT * FROM Managers WHERE Salary BETWEEN 10000 AND 35000;



 

