-- 1. Create the database
CREATE DATABASE SIS_DB;

USE SIS_DB;


-- 2. Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email NVARCHAR(100) NOT NULL,
    phone_number NVARCHAR(15) NOT NULL
);

-- 3. Teacher Table
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    email NVARCHAR(100) NOT NULL
);

-- 4. Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY IDENTITY(1,1),
    course_name NVARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

-- 5. Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- 6. Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- 7. Insert into Students
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) VALUES
('Alice', 'Smith', '2000-01-15', 'alice.smith@example.com', '1234567890'),
('Bob', 'Johnson', '1999-03-22', 'bob.johnson@example.com', '1234567891'),
('Carol', 'Williams', '2001-05-10', 'carol.williams@example.com', '1234567892'),
('David', 'Brown', '1998-07-30', 'david.brown@example.com', '1234567893'),
('Eve', 'Jones', '2002-11-25', 'eve.jones@example.com', '1234567894'),
('Frank', 'Garcia', '2000-08-08', 'frank.garcia@example.com', '1234567895'),
('Grace', 'Martinez', '1997-12-01', 'grace.martinez@example.com', '1234567896'),
('Hank', 'Rodriguez', '1999-09-09', 'hank.rodriguez@example.com', '1234567897'),
('Ivy', 'Lee', '2001-06-16', 'ivy.lee@example.com', '1234567898'),
('Jack', 'Walker', '2003-04-20', 'jack.walker@example.com', '1234567899');

-- 8. Insert into Teacher
INSERT INTO Teacher (first_name, last_name, email) VALUES
('Thomas', 'Anderson', 't.anderson@school.edu'),
('Rachel', 'Green', 'r.green@school.edu'),
('Monica', 'Geller', 'm.geller@school.edu'),
('Chandler', 'Bing', 'c.bing@school.edu'),
('Joey', 'Tribbiani', 'j.tribbiani@school.edu'),
('Ross', 'Geller', 'r.geller@school.edu'),
('Phoebe', 'Buffay', 'p.buffay@school.edu'),
('Janice', 'Hosenstein', 'j.hosenstein@school.edu'),
('Mike', 'Hannigan', 'm.hannigan@school.edu'),
('Gunther', 'Central', 'g.central@school.edu');

-- 9. Insert into Courses
INSERT INTO Courses (course_name, credits, teacher_id) VALUES
('Mathematics', 4, 1),
('English Literature', 3, 2),
('Physics', 4, 3),
('Chemistry', 4, 4),
('Biology', 3, 5),
('Computer Science', 5, 6),
('History', 3, 7),
('Geography', 3, 8),
('Economics', 3, 9),
('Psychology', 4, 10);

-- 10. Insert into Enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-01-11'),
(3, 3, '2024-01-12'),
(4, 4, '2024-01-13'),
(5, 5, '2024-01-14'),
(6, 6, '2024-01-15'),
(7, 7, '2024-01-16'),
(8, 8, '2024-01-17'),
(9, 9, '2024-01-18'),
(10, 10, '2024-01-19');

-- 11. Insert into Payments
INSERT INTO Payments (student_id, amount, payment_date) VALUES
(1, 1000.00, '2024-02-01'),
(2, 1200.00, '2024-02-02'),
(3, 950.00, '2024-02-03'),
(4, 1100.00, '2024-02-04'),
(5, 1050.00, '2024-02-05'),
(6, 1150.00, '2024-02-06'),
(7, 900.00, '2024-02-07'),
(8, 1300.00, '2024-02-08'),
(9, 1250.00, '2024-02-09'),
(10, 1000.00, '2024-02-10');
