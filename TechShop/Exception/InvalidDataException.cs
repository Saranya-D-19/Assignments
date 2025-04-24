using System;

namespace TechShop.Exception
{
    public class InvalidDataException : ApplicationException
    {
        public InvalidDataException(string message) : base(message) { }
    }
}
