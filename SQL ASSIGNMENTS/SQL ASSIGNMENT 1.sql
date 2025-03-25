--Task:1. Database Design: 

create database TechShop

use TechShop

create table Customers(
CustomerID int not null primary key identity,
FirstName varchar(100) not null,
LastName varchar(100) not null,
Email varchar(100) unique not null,
Phone bigint unique not null,
Address varchar(max) not null
)

create table Products(
ProductID int not null primary key identity(101,1),
ProductName varchar(100) not null,
Description varchar(max),
Price int check (price > 0)
)

create table Orders(
OrderID int not null primary key identity(201,1),
CustomerID int not null,
OrderDate date default getdate(),
TotalAmount int check (TotalAmount > 0),
constraint fk_id foreign key (CustomerID) references Customers (CustomerID)
on delete cascade --If a customer is deleted, their orders are deleted 
)

create table OrderDetails(
OrderDetailID int not null primary key identity(301,1),
OrderId int not null,
ProductID int not null,
Quantity int check (Quantity>0),
constraint fk_Oid foreign key (OrderID) references Orders (OrderID)
on delete cascade, --If a order is deleted, their order details are deleted
constraint fk_Pid foreign key (ProductID) references Products (ProductID)
)

create table Inventory(
InventoryId int not null primary key identity(401,1),
ProductID int not null unique,--one stock record per product
QuantityInStock int check (QuantityInStock >= 0),
LastStockUpdate date,
constraint fk_PRid foreign key (ProductID) references Products(ProductID)
on delete cascade -- If a product is deleted, its inventory record is deleted
)


select * from Customers -- where address='chennai'
select * from Products
select * from Orders
select * from OrderDetails
select * from Inventory

insert into Customers (FirstName, LastName, Email, Phone, Address) values 
('Saranya','Deenadayalan','sara@gmail.com','9867567890','Chennai'),
('Rinthiya','Vijayakumar','rin@gmail.com','6111567890','Selam'),
('Suvetha','Selvarpandi','suve@gmail.com','9222227890','Sivagangai'),
('Jessy','Aravind','jess@gmail.com','9867500222','Ooty'),
('Dharani','Kumar','dharu@gmail.com','98677777890','Thanjayur'),
('Swathi','kannan','swa@gmail.com','9867588888','Chennai'),
('Hema','sekar','hema@gmail.com','9454545450','Chennai'),
('Reshma','Khatoon','resh@gmail.com','9867561110','Chennai'),
('Sabarish','Raaja','raaja@gmail.com','9867112230','Ooty'),
('Nithish','Roy','roy@gmail.com','9777708888','Chennai'),
('Valan','Raj','raj@gmail.com','9889898920','Selam'),
('Santhosh','Kumar','kumar@gmail.com','7878967890','Sivagangai')

insert into Products (ProductName, Description, Price) values 
('Wireless Earbuds', 'High-quality sound with noise cancellation.', 2999),
('Smartwatch', 'Stay connected with call, message, and fitness tracking.', 4499),
('Gaming Laptop', 'High-performance machine for gamers and creators.', 75000),
('Portable Blender', 'Compact USB rechargeable blender.', 1990),
('Bluetooth Speaker', 'Waterproof speaker with deep bass.', 3499),
('Mechanical Keyboard', 'RGB backlit keyboard with fast switches.', 4999),
('Fitness Tracker', 'Monitor heart rate, steps, and sleep.', 2999),
('Wireless Charger', 'Fast charging for all devices.', 1999),
('Noise Cancelling Headphones', 'Premium sound with active noise cancellation.', 8999),
('Smart LED Bulb', 'Adjust brightness and color with an app.', 1299),
('Smart Door Lock', 'Keyless entry with fingerprint and mobile app control.', 5999),  
('VR Headset', 'Immersive virtual reality experience for gaming and movies.', 12999)

insert into Orders (CustomerID, OrderDate, TotalAmount) values 
(1, '2025-03-01', 2999),  
(3, '2025-03-02', 75000),  
(5, '2025-03-03', 4499),  
(2, '2025-03-04', 1990),  
(7, '2025-03-05', 3499),  
(4, '2025-03-06', 5999),  
(9, '2025-03-07', 2999),  
(6, '2025-03-08', 1999),  
(8, '2025-03-09', 8999),  
(10, '2025-03-10', 1299),  
(11, '2025-03-11', 75000),  
(12, '2025-03-12', 12999) 

insert into OrderDetails (OrderID, ProductID, Quantity) values  
(201, 101, 2),  
(202, 103, 1),  
(203, 102, 1),  
(204, 104, 3),  
(205, 105, 1),  
(206, 106, 2),  
(207, 107, 1),  
(208, 108, 2),  
(209, 109, 1),  
(210, 110, 4),  
(211, 103, 1),  
(212, 102, 2) 

insert into Inventory (ProductID, QuantityInStock, LastStockUpdate) values  
(101, 50, '2025-03-10'),  
(102, 30, '2025-03-11'),  
(103, 20, '2025-03-12'),  
(104, 40, '2025-03-10'),  
(105, 25, '2025-03-09'),  
(106, 35, '2025-03-11'),  
(107, 45, '2025-03-12'),  
(108, 60, '2025-03-08'),  
(109, 15, '2025-03-13'),  
(110, 55, '2025-03-07'),  
(111, 48, '2025-03-14'),  
(112, 28, '2025-03-14')  

-- Task:2.Select,Where,between,AND,LIKE:

--1. Write an SQL query to retrieve the names and emails of all customers. 

select FirstName,LastName,Email from Customers

--2. Write an SQL query to list all orders with their order dates and corresponding customer names.

select o.OrderID, o.OrderDate, c.Firstname+' '+c.Lastname as CustomerName from Orders o inner join Customers c on o.CustomerId = c.CustomerId

-- 3. Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.

insert into Customers (FirstName, LastName, Email,Phone,Address) values ('Shraven','Ganesh','shra@gmail.com','6666655555','Chennai')

--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.

update Products set price= price+(price/10)

-- 5. Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.

delete from Orders where OrderId= 202

-- 6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.

insert into Orders (CustomerID, OrderDate, TotalAmount) values (13, '2025-03-11', 1999)

-- 7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information.

update Customers set email='shraven@gmail.com',Address='Mumbai' where CustomerID=13

-- 8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table

update Orders
set TotalAmount =( select sum (od.Quantity*p.Price)
from OrderDetails od inner join Products p
on od.ProductID = p.ProductID
where od.OrderID = Orders.OrderID)
where exists (select 1 from OrderDetails where OrderDetails.OrderID = Orders.OrderID)


-- 9. Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.

delete from Customers where Customerid = 4

-- 10. Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details

insert into Products (ProductName, Description, Price) values ('Tab', 'High-quality visual eith easy accessibility.', 19888)

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.
--doubt

alter table Orders 
add  status varchar(50)
update Orders set status = 'Shipped' where OrderID = 201; 

--12. Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.

alter table Customers add OrderCount int default 0

update Customers set OrderCount=(select count(*) from Orders where Orders.CustomerID = Customers.CustomerID)


drop table Customers
drop table Products
drop table Orders
drop table Inventory
drop table OrderDetails


--Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:

--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g.,customer name) for each order.

select c.FirstName+' '+LastName as 'CustomerName',
o.OrderID,o.CustomerID,o.OrderDate,o.TotalAmount 
from Orders o inner join Customers c on o.CustomerID = c.CustomerID

--2. Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue.

select p.ProductID ,p.ProductName,sum(od.quantity*p.price) as 'TotalRevenue' 
from Products p inner join OrderDetails od on p.ProductID=od.ProductID
group by p.ProductID ,p.ProductName

--3. Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information.

select c.CustomerID,c.FirstName+' '+LastName as 'CustomerName',c.Email,C.Phone,c.Address
from Customers c inner join orders o on c.CustomerID=o.CustomerID

--4.Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered.

select p.ProductName, sum(o.Quantity) as TotalQuantityOrdered
from OrderDetails o
inner join Products p on o.ProductID = p.ProductID
group by p.ProductName
having sum(o.Quantity) = (
    select max(TotalQuantity)
    from (
        select sum(Quantity) as TotalQuantity
        from OrderDetails
        group by ProductID
    ) as MaxQuantity
)

-- 5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.

alter table products
add Categories varchar(100) default 'Eletronic Gadget'

update products set categories = 'AudioDevice' where productID=101
update products set categories = 'WearableGadget' where productID=102
update products set categories = 'GamingandComputing' where productID=103
update products set categories = 'Kitchen Appliances' where productID=104
update products set categories = 'AudioDevice' where productID=105
update products set categories = 'GamingandComputing' where productID=106
update products set categories = 'WearableGadget' where productID=107
update products set categories = 'ChargingandAccessories' where productID=108
update products set categories = 'AudioDevice' where productID=109
update products set categories = 'SmartHome' where productID=110
update products set categories = 'SmartHome' where productID=111
update products set categories = 'GamingandComputing' where productID=112

select ProductName , Categories from Products

--6. Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value.

select C.CustomerID, C.FirstName + ' ' + C.LastName as CustomerName, avg(O.TotalAmount) as AverageOrderValue
from Customers C inner JOIN Orders O on C.CustomerID = O.CustomerID
group by C.CustomerID, C.FirstName, C.LastName

--7. Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.

select o.OrderID,c.CustomerID,c.FirstName+' '+LastName as 'CustomerName',o.TotalAmount
from Orders o inner join Customers c on o.CustomerID = c.CustomerID 
where o.TotalAmount = (select max(TotalAmount) from Orders)

--8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.

select p.ProductName , count(od.OrderID) as 'orderCount'
from Products p inner join OrderDetails od 
on p.ProductID=od.ProductID
Group by p.ProductName
order by OrderCount desc

--9. Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter.

select distinct C.CustomerID, C.FirstName + ' ' + C.LastName as CustomerName
from Customers C
inner join Orders O on C.CustomerID = O.CustomerID
inner join OrderDetails OD on O.OrderID = OD.OrderID
inner join Products P on OD.ProductID = P.ProductID
where P.ProductName = 'SmartWatch'

--10. Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters.

select sum(TotalAmount) as TotalRevenue
from Orders
where OrderDate between '2025-03-01' AND '2025-03-06';

--Task 4. Subquery and its type:

--1. Write an SQL query to find out which customers have not placed any orders

select FirstName+' '+LastName as 'CustomerName' from Customers 
where CustomerID not in( select CustomerID from Orders)

--2.Write an SQL query to find the total number of products available for sale

select sum(i.QuantityInStock - coalesce (ordered.TotalOrdered, 0)) as TotalAvailableStock
from Inventory i
left join (
    select ProductID, sum(Quantity) as TotalOrdered
    from OrderDetails
    group by ProductID
) ordered on i.ProductID = ordered.ProductID;


--3. Write an SQL query to calculate the total revenue generated by TechShop. 

select sum(od.Quantity * p.Price) from OrderDetails od inner join Products p on od.ProductID = p.ProductID 

--4. Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter. 

select p.Categories, avg(od.Quantity) as AverageQuantityOrdered from Products p
inner join OrderDetails od on p.ProductID = od.ProductID
where p.Categories = 'WearableGadget'
group by p.Categories

--5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter.

select c.CustomerID, c.FirstName + ' ' + c.LastName as CustomerName, 
sum(od.Quantity * p.Price) as TotalRevenue
from Customers c
inner join Orders o on c.CustomerID = o.CustomerID
inner join OrderDetails od on o.OrderID = od.OrderID
inner join Products p on od.ProductID = p.ProductID
where c.CustomerID = 5
group by c.CustomerID, c.FirstName, c.LastName

--9. Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.

select sum(od.Quantity * p.Price) / count(distinct o.OrderID) as AverageOrderValue from Orders o
inner join OrderDetails od on o.OrderID = od.OrderID
inner join Products p on od.ProductID = p.ProductID

--10. Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count.

select c.CustomerID, c.FirstName + ' ' + c.LastName as CustomerName, 
count(o.OrderID) as OrderCount from Customers c
left join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerID, c.FirstName, c.LastName


