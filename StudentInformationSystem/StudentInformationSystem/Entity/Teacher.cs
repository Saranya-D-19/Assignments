using System;

namespace SIS.entity
{
    public class Teacher
    {
        private int teacherId;
        private string firstName = string.Empty;
        private string lastName = string.Empty;
        private string email = string.Empty;

        public int TeacherId
        {
            get => teacherId;
            set => teacherId = value;
        }

        public string FirstName
        {
            get => firstName;
            set => firstName = value ?? throw new ArgumentNullException(nameof(FirstName));
        }

        public string LastName
        {
            get => lastName;
            set => lastName = value ?? throw new ArgumentNullException(nameof(LastName));
        }

        public string Email
        {
            get => email;
            set
            {
                if (string.IsNullOrWhiteSpace(value) || !value.Contains("@"))
                    throw new ArgumentException("Invalid email address.");
                email = value;
            }
        }

        // Default constructor
        public Teacher() { }

        // Parameterized constructor
        public Teacher(int id, string firstName, string lastName, string email)
        {
            TeacherId = id;
            FirstName = firstName;
            LastName = lastName;
            Email = email;
        }

        public override string ToString()
        {
            return $"Teacher [ID={TeacherId}, Name={FirstName} {LastName}, Email={Email}]";
        }
    }
}
