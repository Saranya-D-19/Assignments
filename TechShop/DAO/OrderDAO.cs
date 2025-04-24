using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using TechShop.Entity;
using TechShop.Util;

namespace TechShop.DAO
{
    public class OrderDAO : IOrderDAO
    {
        public bool PlaceOrder(Order order)
        {
            using SqlConnection conn = Connection.GetConnection();
            string query = "INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES (@custId, @date, @total)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@custId", order.Customer.CustomerID);
            cmd.Parameters.AddWithValue("@date", order.OrderDate);
            cmd.Parameters.AddWithValue("@total", order.TotalAmount);
            return cmd.ExecuteNonQuery() > 0;
        }

        public bool CancelOrder(int orderId)
        {
            using SqlConnection conn = Connection.GetConnection();
            string query = "DELETE FROM Orders WHERE OrderID = @id";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@id", orderId);
            return cmd.ExecuteNonQuery() > 0;
        }

        public List<Order> GetOrdersByCustomer(int customerId)
        {
            List<Order> orders = new();
            using SqlConnection conn = Connection.GetConnection();
            string query = "SELECT * FROM Orders WHERE CustomerID = @custId";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@custId", customerId);
            using SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                orders.Add(new Order
                {
                    OrderID = reader.GetInt32(0),
                    Customer = new Customer { CustomerID = reader.GetInt32(1) }, // Load full info later if needed
                    OrderDate = reader.GetDateTime(2),
                    TotalAmount = reader.GetDecimal(3)
                });
            }
            return orders;
        }
    }
}
