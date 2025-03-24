--Task 1. Database Design:

create database SISDB

use SISDB

Create table Students(
student_id int not null primary key,
first_name varchar(100) not null,
last_name varchar(100)  not null,
date_of_birth date,
email varchar(100) unique not null,
phone_number varchar(100) unique not null
)

create table Courses(
course_id int not null primary key,
course_name varchar(100) not null,
credits int default 0,
teacher_id int,
constraint fk_tid foreign key(teacher_id) references Teacher (teacher_id)
)

create table Enrollments(
enrollment_id int not null primary key,
student_id int,
course_id int,
enrollment_date date default getdate(),
constraint fk_sid foreign key (student_id ) references Students(student_id)
on delete cascade,
constraint fk_cid foreign key (course_id ) references Courses(course_id)
on delete cascade
)

create table Teacher(
teacher_id int not null primary key,
first_name varchar(100) not null,
last_name varchar(100) not null,
email varchar(100) unique not null
)

create table Payments(
payment_id int not null primary key,
student_id int,
amount int default 0,
payment_date date default getdate(),
constraint fk_spfk foreign key (student_id) references Students(student_id)
on delete cascade
)

select*from students
select*from Enrollments
select*from Courses
select*from Teacher
select*from Payments


insert into Students (student_id, first_name, last_name, date_of_birth, email, phone_number) values
(1, 'Saranya', 'Deenadayalan', '2002-05-14', 'saranya.deenadayalan@mail.com', '9876543210'),
(2, 'Rinthiya', 'Vijayakumar', '2001-08-22', 'rinthiya.vijayakumar@mail.com', '9876543211'),
(3, 'Suvetha', 'Bharathi', '2003-03-10', 'suvetha.bharathi@mail.com', '9876543212'),
(4, 'Christin', 'Jessica', '2000-12-30', 'christin.jessica@mail.com', '9876543213'),
(5, 'Dharani', 'Kumar', '2002-07-19', 'dharani.kumar@mail.com', '9876543214'),
(6, 'Shruthi', 'Kumar', '2001-11-05', 'shruthi.kumar@mail.com', '9876543215'),
(7, 'Ramya', 'Sri', '2003-06-25', 'ramya.sri@mail.com', '9876543216'),
(8, 'Swathi', 'Babu', '2000-09-17', 'swathi.babu@mail.com', '9876543217'),
(9, 'Ramya', 'Saravanan', '2002-02-28', 'ramya.saravanan@mail.com', '9876543218'),
(10, 'Lekha', 'Priya', '2001-04-13', 'lekha.priya@mail.com', '9876543219')


 insert into Courses (course_id, course_name, credits, teacher_id) values
(201, 'data structures', 3, 101),
(202, 'database management systems', 4, 102),
(203, 'operating systems', 3, 103),
(204, 'computer networks', 4, 104),
(205, 'software engineering', 3, 105),
(206, 'machine learning', 4, 106),
(207, 'artificial intelligence', 3, 107),
(208, 'embedded systems', 4, 108),
(209, 'cyber security', 3, 109),
(210, 'cloud computing', 4, 110)

insert into Enrollments (enrollment_id, student_id, course_id, enrollment_date) values
(301, 1, 201, '2025-03-01'),
(302, 2, 202, '2025-03-02'),
(303, 3, 203, '2025-03-04'),
(304, 4, 204, '2025-03-04'),
(305, 5, 205, '2025-03-05'),
(306, 6, 206, '2025-03-07'),
(307, 7, 207, '2025-03-07'),
(308, 8, 208, '2025-03-08'),
(309, 9, 209, '2025-03-09'),
(310, 10, 210, '2025-03-10')

insert into Teacher (teacher_id, first_name, last_name, email) values
(101, 'Arun', 'Subu', 'arun.subu@mail.com'),
(102, 'Divya', 'Venkatesan', 'divya.venkatesan@mail.com'),
(103, 'Mohan', 'Ramu', 'mohan.ramu@mail.com'),
(104, 'Priya', 'Sri', 'priya.sri@mail.com'),
(105, 'Suresh', 'Murugan', 'suresh.murugan@mail.com'),
(106, 'Anitha', 'Lakshmanan', 'anitha.lakshmanan@mail.com'),
(107, 'Vikram', 'Perumal', 'vikram.perumal@mail.com'),
(108, 'Meera', 'Rajendran', 'meera.rajendran@mail.com'),
(109, 'Rahul', 'Ganesan', 'rahul.ganesan@mail.com'),
(110, 'Swathi', 'Bala', 'swathi.bala@mail.com')

insert into Payments (payment_id, student_id, amount, payment_date) values
(401, 1, 5000, '2025-03-01'),
(402, 2, 4500, '2025-03-02'),
(403, 3, 6000, '2025-03-01'),
(404, 4, 5500, '2025-03-04'),
(405, 5, 7000, '2025-03-05'),
(406, 6, 6500, '2025-03-05'),
(407, 7, 4800, '2025-03-07'),
(408, 8, 5200, '2025-03-02'),
(409, 9, 5800, '2025-03-02'),
(410, 10, 6300, '2025-03-10')

-- Tasks 2: Select, Where, Between, AND, LIKE:

--1. Write an SQL query to insert a new student into the "Students" table with the following details:

insert into Students (student_id, first_name, last_name, date_of_birth, email, phone_number) values
(11, 'Divya', 'Dinesh', '2002-05-14', 'divya.dinesh@mail.com', '9876540000')


--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date

insert into Enrollments (enrollment_id, student_id, course_id, enrollment_date) values
(311, 1, 203,'2025-03-11')

--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address

update Teacher set email='swathi.swathi@mail.com' where teacher_id=110

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on the student and course.

delete from Enrollments where student_id=6 and course_id=206

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables

alter table Courses
add course_teacher varchar(100)

update Courses set course_teacher = 'Arun Subu' where teacher_id =101
update Courses set course_teacher = 'Divya Venkatesan' where teacher_id =102
update Courses set course_teacher = 'Mohan Ramu' where teacher_id =103
update Courses set course_teacher = 'Priya Sri' where teacher_id =104
update Courses set course_teacher = 'Suresh Murugan' where teacher_id =105
update Courses set course_teacher = 'Anitha	Lakshmanan' where teacher_id =106
update Courses set course_teacher = 'Vikram	Perumal' where teacher_id =107
update Courses set course_teacher = 'Meera	Rajendran' where teacher_id =108
update Courses set course_teacher = 'Rahul	Ganesan' where teacher_id =109
update Courses set course_teacher = 'Swathi	Bala' where teacher_id =110

--6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity.

delete from students where student_id=7 

--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount.

update Payments set amount=6000,payment_date=getdate() where payment_id=401

--Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:

--1. Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID.

select sum(p.amount) as'Total_payment' from Payments p inner join Students s 
on p.student_id = s.student_id where p.student_id = 1

-- 2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.

select c.course_name , count(e.student_id) as'count_of_students' 
from Courses c inner join Enrollments e 
on c.course_id=e.course_id
group by c.course_name

--3.Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments

select s.first_name+' '+last_name as 'studentname'
from students s left join Enrollments e
on s.student_id= e.student_id where e.student_id is null

--4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables

select s.first_name+' '+last_name as 'studentname',c.course_name as 'course_enrolled'
from Students s inner join Enrollments e
on s.student_id=e.student_id 
inner join Courses c on e.course_id = c.course_id 

--5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.

select t.first_name+' '+last_name as 'teacher_name',c.course_name 
from Teacher t inner join Courses c 
on t.teacher_id=c.teacher_id

--6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.

select s.first_name+' '+last_name as 'studentname',e.enrollment_date 
from Students s inner join Enrollments e
on s.student_id= e.student_id
inner join courses c
on c.course_id=e.course_id 
where course_name ='cyber security'

--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.

select s.first_name+' '+last_name as 'studentname' 
from Students s inner join Payments p
on s.student_id=p.student_id where p.student_id is null

--8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records

select c.course_name 
from Courses c left join Enrollments e
on c.course_id=e.course_id 
where e.course_id is null

--9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records

select e1.student_id from Enrollments e1  join Enrollments e2
on e1.student_id=e2.student_id and e1.course_id <> e2.course_id -- <> Ensures they are enrolled in different courses

--10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.

select t.first_name+' '+last_name as 'teacher_name'
from Teacher t left join Courses c 
on t.teacher_id=c.teacher_id
where c.teacher_id is null

-- Task 4. Subquery and its type:

--1. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this.

select avg(student_count) as 'Avg_student_count'
from( select c.course_id, count(student_id) as student_count
from courses c left join Enrollments e
on c.course_id = e.course_id
group by c.course_id
) as course_student_counts

--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.

select s.first_name+' '+last_name as 'studentname' 
from Students s inner join Payments p
on s.student_id = p.student_id
where p.amount= (select max(amount) from Payments)

--3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count.

select top 1 c.course_name 
from Courses c inner join Enrollments e
on c.course_id=e.course_id
group by c.course_id,c.course_name
order by count(e.student_id)desc

--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.

select t.teacher_id, t.first_name + ' ' + t.last_name as teacher_name, sum(p.amount) as 'total_payments'
from Teacher t
inner join Courses c on t.teacher_id = c.teacher_id
inner join Enrollments e on c.course_id = e.course_id
inner join Payments p on e.student_id = p.student_id
group by t.teacher_id, t.first_name, t.last_name;

--5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses.

select s. student_id,s.first_name+' '+last_name as 'studentname' 
from students s inner join Enrollments e
on s.student_id=e.student_id
group by s. student_id,s.first_name,s.last_name
having count(e.course_id)=(select count(course_id) from Courses)

--6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.

select t.teacher_id,t.first_name + ' ' + t.last_name as 'teacher_name'
from Teacher t left join Courses c
on t.teacher_id=c.teacher_id
where c.teacher_id is null
group by t.teacher_id,t.first_name,t.last_name

--7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth

select avg(age) as average_age 
from (select datediff(year, date_of_birth, getdate()) as age from Students) as Age

--8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records.

select c.course_name from Courses c left join Enrollments e
on c.course_id=e.course_id
where e.course_id is null

--9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments

select s. student_id,s.first_name+' '+last_name as 'studentname',c.course_id,c.course_name,sum(p.amount)as 'total_payment'
from Students s
inner join Enrollments e on s.student_id = e.student_id
inner join Courses c on c.course_id = e.course_id
inner join Payments p on s.student_id = p.student_id
group by s.student_id,s.first_name,s.last_name, c.course_id, c.course_name

--10. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average.

select s.student_id,s.first_name+' '+last_name as 'studentname',avg(p.amount) as 'average_payment'
from Students s inner join Payments p
on s.student_id=p.student_id
Group by s.student_id,s.first_name,s.last_name



drop table courses
drop table Enrollments
drop table Payments
drop table students