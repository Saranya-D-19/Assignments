using System;

namespace TechShop.Exception
{
    public class IncompleteOrderException : ApplicationException
    {
        public IncompleteOrderException(string message) : base(message) { }
    }
}
