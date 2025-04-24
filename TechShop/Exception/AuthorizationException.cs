using System;

namespace TechShop.Exception
{
    public class AuthorizationException : ApplicationException
    {
        public AuthorizationException(string message) : base(message) { }
    }
}
