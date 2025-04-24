using System;

namespace SIS.exception
{
    public class PaymentValidationException : Exception
    {
        public PaymentValidationException() : base("Invalid payment details.") { }

        public PaymentValidationException(string message) : base(message) { }
    }
}
