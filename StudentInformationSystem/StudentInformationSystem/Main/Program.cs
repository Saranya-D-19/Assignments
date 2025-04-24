using System;
using SIS.entity;
using SIS.DAO;
using SIS.exception;
using SIS.Utility;
using System.Collections.Generic;

namespace SIS
{
    class Program
    {
        static void Main(string[] args)
        {
            string connectionString = Properties.GetConnectionString();
            IStudentDAO studentDAO = new StudentDAO(connectionString);

            while (true)
            {
                Console.WriteLine("\n=== Student Information System ===");
                Console.WriteLine("1. Add Student");
                Console.WriteLine("2. Get Student by ID");
                Console.WriteLine("3. Get All Students");
                Console.WriteLine("4. Update Student");
                Console.WriteLine("5. Delete Student");
                Console.WriteLine("6. Exit");
                Console.Write("Enter your choice: ");

                string? choice = Console.ReadLine();

                switch (choice)
                {
                    case "1":
                        AddStudent(studentDAO);
                        break;
                    case "2":
                        GetStudentById(studentDAO);
                        break;
                    case "3":
                        GetAllStudents(studentDAO);
                        break;
                    case "4":
                        UpdateStudent(studentDAO);
                        break;
                    case "5":
                        DeleteStudent(studentDAO);
                        break;
                    case "6":
                        Console.WriteLine("Exiting...");
                        return;
                    default:
                        Console.WriteLine("Invalid choice. Try again.");
                        break;
                }
            }
        }

        static void AddStudent(IStudentDAO dao)
        {
            Console.Write("First Name: ");
            string ?firstName = Console.ReadLine();
            Console.Write("Last Name: ");
            string? lastName = Console.ReadLine();
            Console.Write("Date of Birth (yyyy-MM-dd): ");
            DateTime dob = DateTime.Parse(Console.ReadLine()!);
            Console.Write("Email: ");
            string? email = Console.ReadLine();
            Console.Write("Phone Number: ");
            string? phone = Console.ReadLine();

            Student student = new Student
            {
                FirstName = firstName,
                LastName = lastName,
                DateOfBirth = dob,
                Email = email,
                PhoneNumber = phone
            };

            dao.AddStudent(student);
            Console.WriteLine("Student added successfully.");
        }

        static void GetStudentById(IStudentDAO dao)
        {
            Console.Write("Enter Student ID: ");
            int id = int.Parse(Console.ReadLine()!);

            try
            {
                Student student = dao.GetStudentById(id);
                PrintStudent(student);
            }
            catch (StudentNotFoundException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        static void GetAllStudents(IStudentDAO dao)
        {
            List<Student> students = dao.GetAllStudents();
            foreach (var student in students)
            {
                PrintStudent(student);
                Console.WriteLine("-----------------------");
            }
        }

        static void UpdateStudent(IStudentDAO dao)
        {
            Console.Write("Enter Student ID to update: ");
            int id = int.Parse(Console.ReadLine()!);

            try
            {
                Student student = dao.GetStudentById(id);

                Console.Write("New First Name (leave blank to keep current): ");
                string? firstName = Console.ReadLine();
                Console.Write("New Last Name (leave blank to keep current): ");
                string? lastName = Console.ReadLine();
                Console.Write("New Date of Birth (yyyy-MM-dd): ");
                string? dobInput = Console.ReadLine();
                Console.Write("New Email (leave blank to keep current): ");
                string? email = Console.ReadLine();
                Console.Write("New Phone Number (leave blank to keep current): ");
                string? phone = Console.ReadLine();

                student.FirstName = string.IsNullOrWhiteSpace(firstName) ? student.FirstName : firstName;
                student.LastName = string.IsNullOrWhiteSpace(lastName) ? student.LastName : lastName;
                student.DateOfBirth = string.IsNullOrWhiteSpace(dobInput) ? student.DateOfBirth : DateTime.Parse(dobInput);
                student.Email = string.IsNullOrWhiteSpace(email) ? student.Email : email;
                student.PhoneNumber = string.IsNullOrWhiteSpace(phone) ? student.PhoneNumber : phone;

                dao.UpdateStudent(student);
                Console.WriteLine("Student updated successfully.");
            }
            catch (StudentNotFoundException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        static void DeleteStudent(IStudentDAO dao)
        {
            Console.Write("Enter Student ID to delete: ");
            int id = int.Parse(Console.ReadLine()!);

            dao.DeleteStudent(id);
            Console.WriteLine("Student deleted successfully.");
        }

        static void PrintStudent(Student student)
        {
            Console.WriteLine($"ID: {student.StudentId}");
            Console.WriteLine($"Name: {student.FirstName} {student.LastName}");
            Console.WriteLine($"DOB: {student.DateOfBirth:yyyy-MM-dd}");
            Console.WriteLine($"Email: {student.Email}");
            Console.WriteLine($"Phone: {student.PhoneNumber}");
        }
    }
}
