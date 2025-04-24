using System;

namespace SIS.exception
{
    public class DuplicateEnrollmentException : Exception
    {
        public DuplicateEnrollmentException() : base("Student is already enrolled in the course.") { }

        public DuplicateEnrollmentException(string message) : base(message) { }
    }
}
