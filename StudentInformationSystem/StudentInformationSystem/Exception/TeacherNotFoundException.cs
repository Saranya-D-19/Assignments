using System;

namespace SIS.exception
{
    public class TeacherNotFoundException : Exception
    {
        public TeacherNotFoundException() : base("Teacher not found.") { }

        public TeacherNotFoundException(string message) : base(message) { }
    }
}
