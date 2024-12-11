#DDL CONSTRAINTS
CREATE DATABASE SALES;
USE SALES;
#creating tables
create table Orders (
Order_Id int auto_increment primary key,
Customer_name varchar(50) not null,
Product_category varchar(100) not null,
Ordered_item varchar(100) not null,
Contact_No varchar(15) unique
);
Desc Sales_orders;
#Add New column
ALTER TABLE Orders Add column Order_quantity varchar(50);
#Rename the Table
Rename table Orders to Sales_orders;
#inserting rows to table
INSERT INTO Sales_orders(Customer_name,Product_category,Ordered_item,Order_quantity,Contact_No)
 VALUES(
'Ahaan','Stationery','Books','10','7890654356'),
('Patrick Graham','Technology','Laptop','5','077345802345'),
('Sara Synder','Kitchenwares','Pots and pan sets','3','067859342134'),
('Laura','Electronics','Television','2','07689546764'),
('Helen Kelly','Stationery','Pen set','50','09876507430'),
('Aleena Maria','Electronics','Iron box','5','08670945342'),
('Peter John','Technology','Laptop','10','09871234589'),
('Mariam John','Kichenwares','Cutlery set','5','0876542346'),
('Linto Joseph','Stationery','Printing paper set','50','04657865321'),
('Anna Maria','Electronics','Microwave','3','09878453210');

select * from Sales_orders;
select Customer_name,Ordered_item from Sales_orders;
update Sales_orders Set Customer_name='Liam'where Order_Id=1;
UPDATE Sales_orders Set Product_category='Kicthenwares'where Order_Id=10;
drop table Sales_orders;

