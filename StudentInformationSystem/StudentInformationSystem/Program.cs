using System;

namespace StudentInformationSystem.entity
{
    public class Student
    {
        private int studentId;
        private string firstName = string.Empty;
        private string lastName = string.Empty;
        private DateTime dateOfBirth;
        private string email = string.Empty;
        private string phoneNumber = string.Empty;

        public int StudentId
        {
            get => studentId;
            set => studentId = value;
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

        public DateTime DateOfBirth
        {
            get => dateOfBirth;
            set => dateOfBirth = value;
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

        public string PhoneNumber
        {
            get => phoneNumber;
            set
            {
                if (string.IsNullOrWhiteSpace(value) || value.Length < 10)
                    throw new ArgumentException("Invalid phone number.");
                phoneNumber = value;
            }
        }

        // Default constructor
        public Student() { }

        // Parameterized constructor
        public Student(int id, string firstName, string lastName, DateTime dob, string email, string phone)
        {
            StudentId = id;
            FirstName = firstName;
            LastName = lastName;
            DateOfBirth = dob;
            Email = email;
            PhoneNumber = phone;
        }

        public override string ToString()
        {
            return $"Student [ID={StudentId}, Name={FirstName} {LastName}, DOB={DateOfBirth.ToShortDateString()}, Email={Email}, Phone={PhoneNumber}]";
        }
    }
}
