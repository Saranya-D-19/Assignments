using System;

namespace TechShop.Exception
{
    public class AuthenticationException : ApplicationException
    {
        public AuthenticationException(string message) : base(message) { }
    }
}
