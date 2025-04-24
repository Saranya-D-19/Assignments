using System;

namespace SIS.exception
{
    public class InvalidEnrollmentDataException : Exception
    {
        public InvalidEnrollmentDataException() : base("Invalid enrollment data provided.") { }

        public InvalidEnrollmentDataException(string message) : base(message) { }
    }
}
