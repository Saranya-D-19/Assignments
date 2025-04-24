using System;

namespace SIS.exception
{
    public class InvalidCourseDataException : Exception
    {
        public InvalidCourseDataException() : base("Invalid course data provided.") { }

        public InvalidCourseDataException(string message) : base(message) { }
    }
}
