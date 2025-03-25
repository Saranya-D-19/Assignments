create database HMBank

use HMBank

create table Customers(
customer_id int not null primary key,
first_name varchar(100) not null,
last_name varchar(100)  not null,
DOB date,
email varchar(100) unique not null,
phone_number varchar(100) unique not null,
address varchar(100)
)

create table Accounts(
account_id int not null primary key,
customer_id int,
account_type varchar(100) check (account_type in('saving','current','zero_balance')),
balance int default 0,
constraint fk_cid foreign key (customer_id) references Customers (customer_id)
on delete cascade
)

create table Transactions(
transaction_id int not null primary key,
account_id int,
transaction_type varchar(100) check (transaction_type in('deposit','withdrawal','transfer')),
amount int default 0,
transaction_date date default getdate(),
constraint fk_aid foreign key (account_id) references Accounts (account_id)
on delete cascade
)


select*from Customers
select*from Transactions
select*from Accounts

--Tasks 2: Select, Where, Between, AND, LIKE:

--1. Insert at least 10 sample records into each of the following tables. 

insert into Customers (customer_id, first_name, last_name, DOB, email, phone_number, address) values
(1, 'Saranya', 'Deenadayalan', '2001-05-15', 'saranya.deenadayalan@gmail.com', '9876543210', 'Anna Street, Chennai'),
(2, 'Rinthiya', 'Vijayakumar', '2002-08-22', 'rinthiya.vijayakumar@gmail.com', '9876543211', 'Kamarajar Street, Madurai'),
(3, 'Suvetha', 'Bharathi', '2003-11-10', 'suvetha.bharathi@gmail.com', '9876543212', 'Gandhi Road, Coimbatore'),
(4, 'Christin', 'Jessica', '2004-03-05', 'christin.jessica@gmail.com', '9876543213', 'Rajaji Salai, Trichy'),
(5, 'Dharani', 'Kumar', '2005-07-19', 'dharani.kumar@gmail.com', '9876543214', 'Periyar Street, Salem'),
(6, 'Shruthi', 'Kumar', '2006-09-30', 'shruthi.kumar@gmail.com', '9876543215', 'Bharathiyar Street, Erode'),
(7, 'Ramya', 'Sri', '2001-06-12', 'ramya.sri@gmail.com', '9876543216', 'Valluvar Street, Tirunelveli'),
(8, 'Swathi', 'Babu', '2002-12-25', 'swathi.babu@gmail.com', '9876543217', 'Avvaiyar Street, Vellore'),
(9, 'Ramya', 'Saravanan', '2003-10-08', 'ramya.saravanan@gmail.com', '9876543218', 'VOC Street, Thanjavur'),
(10, 'Lekha', 'Priya', '2004-02-18', 'lekha.priya@gmail.com', '9876543219', 'Thiruvalluvar Street, Kanyakumari')

insert into Accounts (account_id, customer_id, account_type, balance) values
(101, 1, 'saving', 5000),
(102, 2, 'current', 12000),
(103, 3, 'zero_balance', 0),
(104, 4, 'saving', 7500),
(105, 5, 'current', 20000),
(106, 6, 'saving', 6500),
(107, 7, 'zero_balance', 0),
(108, 8, 'current', 15000),
(109, 9, 'saving', 8700),
(110, 10, 'zero_balance', 0)

insert into Transactions (transaction_id, account_id, transaction_type, amount, transaction_date) values
(201, 101, 'deposit', 50000, '2025-03-01'),
(202, 102, 'withdrawal', 2000, '2025-03-02'),
(203, 103, 'deposit', 10000, '2025-03-03'),
(204, 104, 'withdrawal', 3000, '2025-03-04'),
(205, 105, 'transfer', 4000, '2025-03-05'),
(206, 106, 'deposit', 7000, '2025-03-06'),
(207, 107, 'withdrawal', 1500, '2025-03-07'),
(208, 108, 'transfer', 2500, '2025-03-08'),
(209, 109, 'deposit', 8000, '2025-03-09'),
(210, 110, 'withdrawal', 1000, '2025-03-10')

--2.Write a SQL query to retrieve the name, account type and email of all customers. 

select c.first_name+' '+last_name as'customername',a.account_type ,c.email
from Customers c inner join Accounts a
on c.customer_id=a.customer_id

--3.Write a SQL query to list all transaction corresponding customer

select t.transaction_id,c.first_name+' '+last_name as'customername',
a.account_id,t.transaction_type,t.amount,t.transaction_date
from Customers c inner join Accounts a
on c.customer_id=a.customer_id
inner join transactions t on a.account_id = t.account_id

--4. Write a SQL query to increase the balance of a specific account by a certain amount.

update Accounts set balance=(5*balance) where account_id=1

--5. Write a SQL query to Combine first and last names of customers as a full_name

select first_name+' '+last_name as 'full_name' from Customers

--6.Write a SQL query to remove accounts with a balance of zero where the account type is savings

delete from Accounts where balance=0 and account_type='saving'

--7.Write a SQL query to Find customers living in a specific city.

select first_name+' '+last_name as 'customername' from Customers
where address like '%Chennai'

--8.Write a SQL query to Get the account balance for a specific account

select balance from Accounts where account_id = 2

--9.Write a SQL query to List all current accounts with a balance greater than $1,000.

select account_id , account_type from Accounts where account_type='current' and balance > 1000

--10. Write a SQL query to Retrieve all transactions for a specific account.

select * from Transactions where account_id=1

--11.Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate
--r=5,t=3 yrs

select a.account_id, (a.balance * 5 * 3) / 100 as interest 
from Accounts a where a.account_type = 'saving';

--12. Write a SQL query to Find customers not living in a specific city

select first_name+' '+last_name as 'customername' from Customers
where address not in ('VOC Street, Thanjavur')

--Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins:

-- 1. Write a SQL query to Find the average account balance for all customers

select c.first_name+' '+c.last_name as 'customername',avg(balance) as 'avgaccbalance'
from Customers c inner join Accounts a 
on c.customer_id = a.customer_id
group by c.first_name,c.last_name
order by avgaccbalance desc

--2. Write a SQL query to Retrieve the top 10 highest account balances.

select top 10 c.first_name+' '+c.last_name as 'customername',a.balance as 'account_balance'
from Customers c inner join Accounts a 
on c.customer_id = a.customer_id
group by c.first_name,c.last_name,a.balance
order  by account_balance desc

--3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.

select sum(amount) as'total_deposits' from Transactions 
where transaction_type='deposit' and transaction_date='2025-03-01'

--4. Write a SQL query to Find the Oldest and Newest Customers.

select * from Customers 
where DOB = (select min(DOB) from Customers)

select * from Customers 
where DOB = (select max(DOB) from Customers)

-- 5. Write a SQL query to Retrieve transaction details along with the account type

select t.transaction_id,t.account_id,t.transaction_type,t.amount,t.transaction_date ,a.account_type
from Transactions t inner join Accounts a 
on t.account_id=a.account_id

--6. Write a SQL query to Get a list of customers along with their account details.

select c.customer_id,c.first_name+' '+c.last_name as 'customername', a.account_id,a.account_type,a.balance
from Customers c inner join Accounts a
on c.customer_id=a.customer_id

--7. Write a SQL query to Retrieve transaction details along with customer information for a specific account.

select t.transaction_id,c.customer_id,c.first_name+' '+last_name as'customername',c.email,c.phone_number,
a.account_id,t.transaction_type,t.amount,t.transaction_date
from Customers c inner join Accounts a
on c.customer_id=a.customer_id
inner join transactions t on a.account_id = t.account_id
where c.customer_id=1

--8. Write a SQL query to Identify customers who have more than one account

select c.customer_id,c.first_name+' '+c.last_name as 'customername',count(a.account_id) as'total_account'
from Customers c inner join Accounts a
on c.customer_id=a.customer_id 
group by c.customer_id, c.first_name, c.last_name
having count(a.account_id)>1

--9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals.

select (select sum(amount) from Transactions where Transaction_type ='deposit' )- (
select sum(amount) from Transactions where Transaction_type ='withdrawal' ) 
as 'diff_in_trasactions' 

--10. Calculate the total balance for each account type

select account_type,sum(balance) as 'total_balance' from Accounts
group by account_type

--11. Identify accounts with the highest number of transactions order by descending order

select top 1 a.account_id ,count(t.transaction_id) as 'highest_transactions'
from Accounts a inner join Transactions t
on a.account_id=t.account_id
group by a.account_id,t.transaction_id
order by count(transaction_id) desc

--12. List customers with high aggregate account balances, along with their account types.

select c.customer_id, c.first_name+' '+c.last_name as 'customername',a.account_type,sum(balance) as 'total_balance'
from Customers c inner join Accounts a
on c.customer_id=a.customer_id
group by c.customer_id, c.first_name,c.last_name,a.account_type
order by total_balance desc

--13. Identify and list duplicate transactions based on transaction amount, date, and account.

select count(t.Transaction_id) as 'duplicate transactions' , a.account_id,t.amount,t.transaction_date
from Transactions t inner join Accounts a 
on t.account_id=t.account_id
group by a.account_id,t.amount,t.transaction_date
having count(transaction_id) >1

--Tasks 4: Subquery and its type:

--1. Retrieve the customer(s) with the highest account balance

select c.first_name+' '+c.last_name as 'customername', a.balance as 'highest_acc_balance' 
from Customers c left join Accounts a
on c.customer_id=a.customer_id
where a.balance= (select max(balance) from Accounts)

--2. Calculate the average account balance for customers who have more than one account.

select c.first_name+' '+c.last_name as 'customername',avg(a.balance) as 'avg_balance' 
from Customers c left join Accounts a
on c.customer_id=a.customer_id
group by c.first_name,c.last_name,a.balance
having count(account_id)>1

--3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.

select a.account_id ,t.Transaction_id,t.transaction_type,t.amount,t.transaction_date
from Accounts a inner join Transactions t
on a.account_id=t.account_id
where t.amount > (select avg(amount) from Transactions)

--4. Identify customers who have no recorded transactions.

select c.customer_id,c.first_name+' '+c.last_name as 'customername'
from Customers c inner join Accounts a
on c.customer_id = a.customer_id
left join Transactions t on t.account_id = a.account_id
where t.transaction_id is null

--5. Calculate the total balance of accounts with no recorded transactions.

select sum (a.balance) as 'total_amount'
from Accounts a left join Transactions t
on a.account_id=t.account_id
where transaction_id is null

--6. Retrieve transactions for accounts with the lowest balance

select a.account_id ,a.balance,t.Transaction_id,t.transaction_type,t.amount,t.transaction_date
from Accounts a inner join Transactions t
on a.account_id=t.account_id
where a.balance =(select min(balance) from Accounts)

--7. Identify customers who have accounts of multiple types.

select c.first_name+' '+c.last_name as 'customername'
from Customers c inner join Accounts a
on c.customer_id = a.customer_id
group by c.first_name,c.last_name
having count(distinct account_type)>1

--8. Calculate the percentage of each account type out of the total number of accounts

select account_type, count(*) as 'account_count',
(count(*)*100/(select count(*) from Accounts))as 'Percentage'
from Accounts
group by account_type


--9. Retrieve all transactions for a customer with a given customer_id.

select c.customer_id,c.first_name+' '+c.last_name as 'customername',t.Transaction_id,t.transaction_type,t.amount,t.transaction_date
from Customers c inner join Accounts a
on c.customer_id = a.customer_id
left join Transactions t on t.account_id = a.account_id
where c.customer_id=2

--10. Calculate the total balance for each account type, including a subquery within the SELECT clause.

select c.customer_id,sum(a.balance) as'total_balance',a.account_type 
from Customers c inner join Accounts a
on c.customer_id=a.customer_id
group by c.customer_id,a.account_type 







