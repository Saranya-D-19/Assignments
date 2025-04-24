using System;

namespace SIS.exception
{
    public class InvalidTeacherDataException : Exception
    {
        public InvalidTeacherDataException() : base("Invalid teacher data provided.") { }

        public InvalidTeacherDataException(string message) : base(message) { }
    }
}
