using System;

namespace TechShop.Exception
{
    public class PaymentFailedException : ApplicationException
    {
        public PaymentFailedException(string message) : base(message) { }
    }
}
