using System;
using System.Collections.Generic;
using Microsoft.Data.SqlClient;
using SIS.entity;
using SIS.exception;
using SIS.Util;

namespace SIS.DAO
{
    public class StudentDAO : IStudentDAO
    {
        private string connectionString;

        public StudentDAO(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public void AddStudent(Student student)
        {
            using SqlConnection connection = Connection.GetConnection();
            connection.Open();

            string query = @"INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
                             VALUES (@FirstName, @LastName, @DateOfBirth, @Email, @PhoneNumber)";

            using SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@FirstName", student.FirstName);
            cmd.Parameters.AddWithValue("@LastName", student.LastName);
            cmd.Parameters.AddWithValue("@DateOfBirth", student.DateOfBirth);
            cmd.Parameters.AddWithValue("@Email", student.Email);
            cmd.Parameters.AddWithValue("@PhoneNumber", student.PhoneNumber);

            cmd.ExecuteNonQuery();
        }

        public Student GetStudentById(int studentId)
        {
            Student? student = null;
            using SqlConnection conn = Connection.GetConnection();
            conn.Open();

            string query = "SELECT * FROM Students WHERE student_id = @StudentId";
            using SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@StudentId", studentId);

            using SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                student = new Student
                {
                    StudentId = Convert.ToInt32(reader["student_id"]),
                    FirstName = reader["first_name"].ToString(),
                    LastName = reader["last_name"].ToString(),
                    DateOfBirth = Convert.ToDateTime(reader["date_of_birth"]),
                    Email = reader["email"].ToString(),
                    PhoneNumber = reader["phone_number"].ToString()
                };
            }
            return student;
        }

        public List<Student> GetAllStudents()
        {
            List<Student> students = new List<Student>();
            using SqlConnection conn = Connection.GetConnection();
            conn.Open();

            string query = "SELECT * FROM Students";
            using SqlCommand cmd = new SqlCommand(query, conn);
            using SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Student student = new Student
                {
                    StudentId = Convert.ToInt32(reader["student_id"]),
                    FirstName = reader["first_name"].ToString(),
                    LastName = reader["last_name"].ToString(),
                    DateOfBirth = Convert.ToDateTime(reader["date_of_birth"]),
                    Email = reader["email"].ToString(),
                    PhoneNumber = reader["phone_number"].ToString()
                };
                students.Add(student);
            }

            return students;
        }

        public void UpdateStudent(Student student)
        {
            using SqlConnection connection = Connection.GetConnection();
            connection.Open();

            string query = @"UPDATE Students 
                             SET first_name = @FirstName, 
                                 last_name = @LastName, 
                                 date_of_birth = @DateOfBirth, 
                                 email = @Email, 
                                 phone_number = @PhoneNumber 
                             WHERE student_id = @StudentId";

            using SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@FirstName", student.FirstName);
            cmd.Parameters.AddWithValue("@LastName", student.LastName);
            cmd.Parameters.AddWithValue("@DateOfBirth", student.DateOfBirth);
            cmd.Parameters.AddWithValue("@Email", student.Email);
            cmd.Parameters.AddWithValue("@PhoneNumber", student.PhoneNumber);
            cmd.Parameters.AddWithValue("@StudentId", student.StudentId);

            cmd.ExecuteNonQuery();
        }

        public void DeleteStudent(int studentId)
        {
            using SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            // Step 1: Delete dependent records in Payments
            string deletePaymentsQuery = "DELETE FROM Payments WHERE student_id = @StudentId";
            SqlCommand deletePaymentsCmd = new SqlCommand(deletePaymentsQuery, connection);
            deletePaymentsCmd.Parameters.AddWithValue("@StudentId", studentId);
            deletePaymentsCmd.ExecuteNonQuery();

            // Step 2: Delete dependent records in Enrollments
            string deleteEnrollmentsQuery = "DELETE FROM Enrollments WHERE student_id = @StudentId";
            SqlCommand deleteEnrollmentsCmd = new SqlCommand(deleteEnrollmentsQuery, connection);
            deleteEnrollmentsCmd.Parameters.AddWithValue("@StudentId", studentId);
            deleteEnrollmentsCmd.ExecuteNonQuery();

            // Step 3: Delete the student
            string deleteStudentQuery = "DELETE FROM Students WHERE student_id = @StudentId";
            SqlCommand deleteStudentCmd = new SqlCommand(deleteStudentQuery, connection);
            deleteStudentCmd.Parameters.AddWithValue("@StudentId", studentId);
            deleteStudentCmd.ExecuteNonQuery();
        }


    }
}
