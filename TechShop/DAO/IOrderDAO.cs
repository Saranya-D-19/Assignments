using System.Collections.Generic;
using TechShop.Entity;

namespace TechShop.DAO
{
    public interface IOrderDAO
    {
        bool PlaceOrder(Order order);
        bool CancelOrder(int orderId);
        List<Order> GetOrdersByCustomer(int customerId);
    }
}
