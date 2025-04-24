using System;

namespace SIS.exception
{
    public class InsufficientFundsException : Exception
    {
        public InsufficientFundsException() : base("Insufficient funds for enrollment.") { }

        public InsufficientFundsException(string message) : base(message) { }
    }
}
