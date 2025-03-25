create database Courier_man_system

use courier_man_system

CREATE TABLE User_tab(
UserID INT NOT NULL PRIMARY KEY,
Name VARCHAR(255) NOT NULL,
Email VARCHAR(255) UNIQUE NOT NULL,
Password VARCHAR(255) UNIQUE NOT NULL,
ContactNumber VARCHAR(20) UNIQUE NOT NULL,
Address TEXT
)

create table Courier (
CourierID INT NOT NULL PRIMARY KEY,
SenderName VARCHAR(255) NOT NULL,
SenderAddress TEXT,
ReceiverName VARCHAR(255) NOT NULL,
ReceiverAddress TEXT,
Weight DECIMAL(5, 2) DEFAULT 0,
Status VARCHAR(50),
TrackingNumber VARCHAR(20) UNIQUE NOT NULL,
DeliveryDate DATE DEFAULT GETDATE()
)

create table CourierServices(
ServiceID INT NOT NULL PRIMARY KEY,
ServiceName VARCHAR(100),
Cost DECIMAL(8, 2) DEFAULT 0
)

create table Employee (
EmployeeID INT NOT NULL PRIMARY KEY,
Name VARCHAR(255) NOT NULL,
Email VARCHAR(255) UNIQUE NOT NULL,
ContactNumber VARCHAR(20) UNIQUE NOT NULL,
Role VARCHAR(50),
Salary DECIMAL(10, 2) DEFAULT 0
)

create table Location 
(LocationID INT NOT NULL PRIMARY KEY,
LocationName VARCHAR(100),
Address TEXT
) 

create table Payment(
PaymentID INT NOT NULL PRIMARY KEY,
CourierID INT NOT NULL,
LocationId INT,
Amount DECIMAL(10, 2) DEFAULT 0,
PaymentDate DATE DEFAULT GETDATE(),
CONSTRAINT FK_CID FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
CONSTRAINT FK_LOC FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
)

select * from User_tab
select * from Employee
select * from Courier
select* from CourierServices
select * from Payment
select * from Location


INSERT INTO User_tab (UserID, Name, Email, Password, ContactNumber, Address)
VALUES (1, 'Saranya Deenadayalan', 'saranya.deenadayalan@mail.com', 'Saranya@123', '9876543210', 'Anna Nagar, Chennai'),
(2, 'Rinthiya Vijayakumar', 'rinthiya.vijayakumar@mail.com', 'Rinthiya@123', '9876543211', 'Gandhi Road, Coimbatore'),
(3, 'Suvetha Bharathi', 'suvetha.bharathi@mail.com', 'Suvetha@123', '9876543212', 'MG Street, Madurai'),
(4, 'Christin Jessica', 'christin.jessica@mail.com', 'Christin@123', '9876543213', 'Race Course, Trichy'),
(5, 'Dharani Kumar', 'dharani.kumar@mail.com', 'Dharani@123', '9876543214', 'Town Hall, Salem'),
(6, 'Shruthi Kumar', 'shruthi.kumar@mail.com', 'Shruthi@123', '9876543215', 'Avinashi Road, Tiruppur'),
(7, 'Ramya Sri', 'ramya.sri@mail.com', 'Ramya@123', '9876543216', 'VOC Nagar, Erode'),
(8, 'Swathi Babu', 'swathi.babu@mail.com', 'Swathi@123', '9876543217', 'Court Road, Vellore'),
(9, 'Ramya Saravanan', 'ramya.saravanan@mail.com', 'Ramyasri@123', '9876543218', 'Market Street, Thanjavur'),
(10, 'Lekha Priya', 'lekha.priya@mail.com', 'Lekha@123', '9876543219', 'Central Bus Stand, Dindigul')


INSERT INTO Courier (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate)
VALUES (101,'Saranya Deenadayalan', 'Anna Nagar, Chennai', 'Rinthiya Vijayakumar', 'Gandhi Road, Coimbatore', 2.50, 'In Transit', 'TRK1234567890', '2025-03-25'),
(102, 'Suvetha Bharathi', 'MG Street, Madurai', 'Christin Jessica', 'Race Course, Trichy', 1.75, 'Delivered', 'TRK0987654321', '2025-03-22'),
(103, 'Dharani Kumar', 'Town Hall, Salem', 'Shruthi Kumar', 'Avinashi Road, Tiruppur', 3.20, 'Pending', 'TRK1122334455', '2025-03-28'),
(104, 'Ramya Sri', 'VOC Nagar, Erode', 'Swathi Babu', 'Court Road, Vellore', 2.80, 'Out for Delivery', 'TRK6677889900', '2025-03-26'),
(105, 'Ramya Saravanan', 'Market Street, Thanjavur', 'Lekha Priya', 'Central Bus Stand, Dindigul', 1.95, 'Shipped', 'TRK5566778899', '2025-03-27'),
(106, 'Christin Jessica', 'Race Course, Trichy', 'Dharani Kumar', 'Town Hall, Salem', 4.10, 'In Transit', 'TRK3344556677', '2025-03-29'),
(107, 'Shruthi Kumar', 'Avinashi Road, Tiruppur', 'Ramya Sri', 'VOC Nagar, Erode', 2.30, 'Pending', 'TRK7788990011', '2025-03-30'),
(108, 'Swathi Babu', 'Court Road, Vellore', 'Ramya Saravanan', 'Market Street, Thanjavur', 3.00, 'Delivered', 'TRK8899001122', '2025-03-23'),
(109, 'Lekha Priya', 'Central Bus Stand, Dindigul', 'Saranya Deenadayalan', 'Anna Nagar, Chennai', 5.00, 'Out for Delivery', 'TRK9911223344', '2025-03-31'),
(110, 'Rinthiya Vijayakumar', 'Gandhi Road, Coimbatore', 'Suvetha Bharathi', 'MG Street, Madurai', 1.50, 'Shipped', 'TRK2233445566', '2025-03-24')


INSERT INTO CourierServices (ServiceID, ServiceName, Cost)
VALUES (201, 'Standard Delivery', 150.50),
(202, 'Express Delivery', 300.75),
(203, 'Same-Day Delivery', 500.00),
(204, 'Overnight Delivery', 450.20),
(205, 'International Shipping', 1000.50),
(206, 'Standard Delivery', 120.30),
(207, 'Express Delivery', 320.00),
(208, 'Same-Day Delivery', 550.50),
(209, 'Cash on Delivery (COD)', 50.25),
(210, 'Cash on Delivery (COD)', 60.00)

INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)
VALUES (301, 'Arun Kumar', 'arunkumar@mail.com', '9876543210', 'Manager', 75000.00),
(302, 'Divya Ramesh', 'divyaramesh@mail.com', '9876543211', 'Supervisor', 60000.00),
(303, 'Balaji Narayanan', 'balaji@mail.com', '9876543212', 'HR Executive', 50000.00),
(304, 'Meena Rajesh', 'meena@mail.com', '9876543213', 'Operations Head', 80000.00),
(305, 'Praveen Mohan', 'praveen@mail.com', '9876543214', 'Software Engineer', 65000.00),
(306, 'Lakshmi Subramanian', 'lakshmi@mail.com', '9876543215', 'Accountant', 55000.00),
(307, 'Ravi Shankar', 'ravi@mail.com', '9876543216', 'Logistics Coordinator', 48000.00),
(308, 'Keerthi Venkatesh', 'keerthi@mail.com', '9876543217', 'Sales Executive', 52000.00),
(309, 'Manoj Karthik', 'manoj@mail.com', '9876543218', 'Customer Support', 45000.00),
(310, 'Sowmya Natarajan', 'sowmya@mail.com', '9876543219', 'Warehouse Manager', 70000.00)


INSERT INTO Location (LocationID, LocationName, Address)
VALUES (401, 'Chennai Hub', 'Anna Nagar, Chennai'),
(402, 'Coimbatore Hub', 'Gandhi Road, Coimbatore'),
(403, 'Madurai Hub', 'MG Street, Madurai'),
(404, 'Trichy Hub', 'Race Course, Trichy'),
(405, 'Salem Hub', 'Town Hall, Salem'),
(406, 'Tiruppur Hub', 'Avinashi Road, Tiruppur'),
(407, 'Erode Hub', 'VOC Nagar, Erode'),
(408, 'Vellore Hub', 'Court Road, Vellore'),
(409, 'Dindigul Hub', 'Central Bus Stand, Dindigul'),
(410, 'Thanjavur Hub', 'Market Street, Thanjavur')

INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate)
VALUES (501, 101, 401, 250.00, '2025-03-22'),
(502, 102, 402, 400.00, '2025-03-23'),
(503, 103, 403, 320.00, '2025-03-24'),
(504, 104, 404, 150.00, '2025-03-25'),
(505, 105, 405, 500.00, '2025-03-26'),
(506, 106, 406, 200.00, '2025-03-27'),
(507, 107, 407, 450.00, '2025-03-28'),
(508, 108, 408, 120.00, '2025-03-29'),
(509, 109, 409, 600.00, '2025-03-30'),
(510, 110, 410, 700.00, '2025-03-31')

--Task 2: Select,Where

--1. List all customers: 

select Name from User_tab

--2. List all orders for a specific customer:

select c.CourierID, c.SenderName,c.SenderAddress, c.ReceiverName, c.ReceiverAddress,c.Weight,c.Status,c.TrackingNumber,c.Deliverydate
from Courier c inner join User_tab u
on c.SenderName=u.Name
where UserID=2

--3. List all couriers:

select * from Courier

--4. List all packages for a specific order:

select * from Courier where CourierID=104

--5. List all deliveries for a specific courier:

select c.CourierID,c.TrackingNumber,l.LocationName,l.Address,p.Amount
from Courier c inner join Payment p
on c.CourierID = p.CourierID
inner join Location l on l.LocationID=p.LocationId
where c.CourierID=105

--6. List all undelivered packages:

select * from Courier where status='pending'

--7. List all packages that are scheduled for delivery today: 

select * from Courier where DeliveryDate=getdate()

--8. List all packages with a specific status:

select * from Courier where status='Delivered'

--9. Calculate the total number of packages for each courier. 

select CourierID,count(*) as 'totalpackages' from Courier 
group by courierID
order by CourierID asc

--10. Find the average delivery time for each courier 

select c.CourierID,avg(datediff(day,p.paymentdate,c.DeliveryDate)) as 'Avg_Delivery_time' 
from Courier c inner join payment p
on c.CourierID=p.CourierID
group by c.CourierID
order by CourierID asc

--11. List all packages with a specific weight range: 

select * from Courier where weight between 1.50 and 2.50

--12. Retrieve employees whose names contain 'John' 
-- instead of john I used Ravi

select * from Employee where name like ('%Ravi%')

--13. Retrieve all courier records with payments greater than $50

select c.CourierID,c.SenderName,c.Senderaddress,c.ReceiverAddress,c.ReceiverAddress,c.Weight,c.Status,c.TrackingNumber,c.DeliveryDate
from Courier c inner join Payment p
on c.CourierID=p.CourierID
where p.Amount > 200

--Task 3: GroupBy, Aggregate Functions, Having, Order By, where

--14. Find the total number of couriers handled by each employee. 

alter table Courier
add EmployeeID int

update Courier set EmployeeID = 201 where courierID=101
update Courier set EmployeeID = 202 where courierID=102
update Courier set EmployeeID = 203 where courierID=103
update Courier set EmployeeID = 204 where courierID=104
update Courier set EmployeeID = 205 where courierID=105
update Courier set EmployeeID = 206 where courierID=106
update Courier set EmployeeID = 207 where courierID=107
update Courier set EmployeeID = 208 where courierID=108
update Courier set EmployeeID = 209 where courierID=109
update Courier set EmployeeID = 210 where courierID=110

select e.EmployeeID ,e.name, count(c.CourierID) as 'totalCourier' 
from Courier c left join Employee e
on c.EmployeeID = e.EmployeeID
group by e.EmployeeID,e.name

--15. Calculate the total revenue generated by each location

select l.LocationID,l.LocationName,sum(p.amount) as 'total_revenue'
from Location l left join Payment p
on l.LocationID=p.LocationId
group by l.LocationID,l.LocationName

--16. Find the total number of couriers delivered to each location. 

select l.locationID,l.LocationName,count(c.CourierID) as 'TotalCourier'
from Courier c inner join Payment p
on c.CourierID=p.CourierID
inner join Location l on l.LocationID=p.LocationId
group by l.locationID,l.LocationName

--17. Find the courier with the highest average delivery time: 

select top 1 c.CourierID,(avg(datediff(day,p.paymentdate,c.DeliveryDate))) as 'Avg_Delivery_time' 
from Courier c inner join payment p
on c.CourierID=p.CourierID
group by c.CourierID
order by Avg_Delivery_time desc

--18. Find Locations with Total Payments Less Than a Certain Amount 

select l.LocationName, sum(p.Amount)
from Location l inner join Payment p
on l.LocationID=p.LocationId
group by l.LocationName
having sum(p.Amount)<200

--19. Calculate Total Payments per Location 

select l.LocationName, sum(p.Amount) as 'total_payments'
from Location l inner join Payment p
on l.LocationID=p.LocationId
group by l.LocationName

--20. Retrieve couriers who have received payments totaling more than $1000 in a specific location (LocationID = X): 

select c.CourierID, c.SenderName, c.ReceiverName,c.Weight,c.Status,c.TrackingNumber,c.Deliverydate,sum(p.Amount)
from Courier c inner join Payment p
on c.CourierID=p.CourierID
inner join Location l on l.LocationID=p.LocationId
where l.LocationID=105
group by c.CourierID,c.SenderName,c.ReceiverName,c.Weight,c.Status,c.TrackingNumber,c.Deliverydate
having sum(p.Amount)>200
  

--21. Retrieve couriers who have received payments totaling more than $1000 after a certain date (PaymentDate > 'YYYY-MM-DD'): 

select c.CourierID, c.SenderName, c.ReceiverName, c.Weight,c.Status,c.TrackingNumber,c.Deliverydate,
sum(p.Amount) as'total_amount_received'
from Courier c inner join Payment p
on c.CourierID=p.CourierID
inner join Location l on l.LocationID=p.LocationId
where  p.PaymentDate>'2025-03-28'
group by c.CourierID,c.SenderName, c.ReceiverName,c.Weight,c.Status,c.TrackingNumber,c.Deliverydate
having sum(p.Amount) >200 
order by total_amount_received desc


--22. Retrieve locations where the total amount received is more than $5000 before a certain date (PaymentDate > 'YYYY-MM-DD') 

select l.locationId,l.LocationName, sum(p.amount) as 'total_amount'
from Location l inner join Payment p
on l.LocationID=p.LocationId
where p.PaymentDate>'2025-03-30'
group by l.locationId,l.LocationName
having sum(p.amount)>200

--Task 4: Inner Join,Full Outer Join, Cross Join, Left Outer Join,Right Outer Join 

--23. Retrieve Payments with Courier Information 

select c.CourierID, c.SenderName, c.ReceiverName, c.Weight,c.Status,c.TrackingNumber,c.Deliverydate,p.Amount,p.paymentDate
from Courier c inner join Payment p
on c.CourierID=p.CourierID
order by p.PaymentDate asc

--24. Retrieve Payments with Location Information

select l.LocationID , l.Locationname,l.Address ,p.Amount,p.PaymentDate
from Location l left join Payment p
on l.LocationID=p.LocationId
order by p.PaymentDate asc

--25. Retrieve Payments with Courier and Location Information 

select c.CourierID, c.SenderName,c.SenderAddress, c.ReceiverName, c.ReceiverAddress,c.Weight,c.Status,c.TrackingNumber,c.Deliverydate,
l.LocationID,l.LocationName,l.Address,p.Amount,p.PaymentDate
from Courier c inner join Payment p
on c.CourierID=p.CourierID
inner join Location l on l.LocationID=p.LocationId
order by p.PaymentDate

-- 26. List all payments with courier details 

select c.CourierID,p.Amount,p.PaymentDate
from Courier c inner join Payment p
on c.CourierID=p.CourierID

--27. Total payments received for each courier 

select c.CourierID,sum(p.Amount) as 'total_payment'
from Courier c left join Payment p
on c.CourierID=p.CourierID
group by c.CourierID

--28. List payments made on a specific date

select CourierID,Amount from Payment
where PaymentDate='2025-03-28'

--29. Get Courier Information for Each Payment 

select c.CourierID, c.SenderName,c.SenderAddress, c.ReceiverName, c.ReceiverAddress,c.Weight,c.Status,c.TrackingNumber,c.Deliverydate
from Courier c left join Payment p
on c.CourierID=p.CourierID
order by p.PaymentID

--30. Get Payment Details with Location

select p.PaymentID,p.Amount,l.LocationName
from Payment p inner join Location l
on p.LocationId=l.LocationID

--31. Calculating Total Payments for Each Courier

select c.CourierID, c.SenderName, c.ReceiverName, c.Weight,c.Status,c.TrackingNumber,c.Deliverydate,
sum(p.Amount) as'total_amount'
from Courier c inner join Payment p
on c.CourierID=p.CourierID
group by c.CourierID,c.SenderName, c.ReceiverName,c.Weight,c.Status,c.TrackingNumber,c.Deliverydate

--32. List Payments Within a Date Range 

select paymentID, CourierID,Amount from Payment 
where amount between 300 and 450

--33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side

select u.UserID, u.Name, u.Email, u.ContactNumber, u.Address, c.CourierID, c.SenderName, c.ReceiverName, c.TrackingNumber, c.Status, c.DeliveryDate
from User_tab u full outer join Courier c
on u.Name = c.SenderName  

--34.Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side

alter table payment
add EmployeeID int

update Payment set EmployeeID = 201 where courierID=101
update Payment set EmployeeID = 202 where courierID=102
update Payment set EmployeeID = 203 where courierID=103
update Payment set EmployeeID = 204 where courierID=104
update Payment set EmployeeID = 205 where courierID=105
update Payment set EmployeeID = 206 where courierID=106
update Payment set EmployeeID = 207 where courierID=107
update Payment set EmployeeID = 208 where courierID=108
update Payment set EmployeeID = 209 where courierID=109
update Payment set EmployeeID = 210 where courierID=110


select e.EmployeeID, e.Name, e.Email, e.ContactNumber, e.Role, e.Salary,
p.PaymentID, p.CourierID, p.Amount, p.PaymentDate
from Employee e full outer join Payment p
on e.EmployeeID = p.EmployeeID 

--35. List all users and all courier services, showing all possible combinations

select u.UserID, u.Name, cs.ServiceID, cs.ServiceName
from User_tab u
CROSS JOIN CourierServices cs
order by u.UserID, cs.ServiceID;

--37. List all employees and all locations, showing all possible combinations:

select e.employeeID,e.Name,l.LocationName
from Employee e CROSS JOIN Location l

--38. Retrieve a list of couriers and their corresponding sender information (if available) 

select CourierID, TrackingNumber, Status, SenderName, SenderAddress
from Courier 
order by CourierID

--39. Retrieve a list of couriers and their corresponding receiver information (if available):

select CourierID, TrackingNumber, Status, ReceiverName, ReceiverAddress
from Courier 
order by CourierID

--40.Retrieve a list of employees and the number of couriers assigned to each employee: 

select e.EmployeeID,e.Name,count(c.CourierID) as 'no_of_couriers'
from Employee e left join Courier c
on e.EmployeeID=c.EmployeeID 
group by e.EmployeeID,e.Name
order by e.EmployeeID

--41. Retrieve a list of locations and the total payment amount received at each location:

select l.LocationID,l.LocationName , sum(p.amount) as 'total_amount'
from Location l left join Payment p
on l.LocationID=p.LocationId
group by l.LocationID,l.LocationName

--42. Retrieve all couriers sent by the same sender (based on SenderName).

select CourierID, TrackingNumber, Status, SenderName, SenderAddress
from Courier 
where SenderName in(
select SenderName
from Courier
group by SenderName
having count(senderName) >1)
order by SenderName,CourierID

--43. List all employees who share the same role.

select EmployeeID,Name,role
from Employee
where role in(
select role 
from Employee
group by role
having count(role)>1
)
order by EmployeeID,name

--44. Retrieve all payments made for couriers sent from the same location

select c.courierId ,p.PaymentID, p.Amount
from Courier c inner join Payment p
on c.CourierID=p.CourierID
inner join Location l on l.LocationID=p.LocationId
where LocationName in
(
select LocationName 
from Location
group by LocationName
having count(LocationName)>1
)
order by c.CourierID

--45. List employees and the number of couriers they have delivered:

select e.employeeId,e.name,count(c.courierID) as 'no_of_courier'
from Employee e left join Courier c
on e.EmployeeID=c.EmployeeID
group by  e.employeeId,e.name











