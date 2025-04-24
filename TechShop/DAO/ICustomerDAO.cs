using System.Collections.Generic;
using TechShop.Entity;

namespace TechShop.DAO
{
    public interface ICustomerDAO
    {
        bool AddCustomer(Customer customer);
        Customer? GetCustomerById(int customerId);
        bool UpdateCustomerContact(int customerId, string email, string phone, string address);
        List<Customer> GetAllCustomers();
    }
}
