using System;

namespace SIS.exception
{
    public class StudentNotFoundException : Exception
    {
        public StudentNotFoundException() : base("Student not found.") { }

        public StudentNotFoundException(string message) : base(message) { }
    }
}
