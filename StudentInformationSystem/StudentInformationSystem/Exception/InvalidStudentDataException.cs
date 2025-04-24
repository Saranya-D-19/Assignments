using System;

namespace SIS.exception
{
    public class InvalidStudentDataException : Exception
    {
        public InvalidStudentDataException() : base("Invalid student data provided.") { }

        public InvalidStudentDataException(string message) : base(message) { }
    }
}
