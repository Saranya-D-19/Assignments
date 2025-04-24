using System;

namespace TechShop.Exception
{
    public class InsufficientStockException : ApplicationException
    {
        public InsufficientStockException(string message) : base(message) { }
    }
}
