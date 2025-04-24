using System;

namespace SIS.exception
{
    public class CourseNotFoundException : Exception
    {
        public CourseNotFoundException() : base("Course not found.") { }

        public CourseNotFoundException(string message) : base(message) { }
    }
}
