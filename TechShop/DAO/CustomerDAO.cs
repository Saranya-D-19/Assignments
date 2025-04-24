using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using TechShop.Entity;
using TechShop.Util;

namespace TechShop.DAO
{
    public class CustomerDAO : ICustomerDAO
    {
        public bool AddCustomer(Customer customer)
        {
            using SqlConnection conn = Connection.GetConnection();
            string query = "INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) " +
                           "VALUES (@firstName, @lastName, @email, @phone, @address)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@firstName", customer.FirstName);
            cmd.Parameters.AddWithValue("@lastName", customer.LastName);
            cmd.Parameters.AddWithValue("@email", customer.Email);
            cmd.Parameters.AddWithValue("@phone", customer.Phone);
            cmd.Parameters.AddWithValue("@address", customer.Address);

            return cmd.ExecuteNonQuery() > 0;
        }

        public Customer? GetCustomerById(int customerId)
        {
            using SqlConnection conn = Connection.GetConnection();
            string query = "SELECT * FROM Customers WHERE CustomerID = @id";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@id", customerId);

            using SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                return new Customer
                {
                    CustomerID = reader.GetInt32(0),
                    FirstName = reader.GetString(1),
                    LastName = reader.GetString(2),
                    Email = reader.GetString(3),
                    Phone = reader.GetString(4),
                    Address = reader.GetString(5)
                };
            }

            return null;
        }

        public bool UpdateCustomerContact(int customerId, string email, string phone, string address)
        {
            using SqlConnection conn = Connection.GetConnection();
            string query = "UPDATE Customers SET Email = @email, Phone = @phone, Address = @address WHERE CustomerID = @id";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@id", customerId);

            return cmd.ExecuteNonQuery() > 0;
        }

        public List<Customer> GetAllCustomers()
        {
            List<Customer> customers = new();
            using SqlConnection conn = Connection.GetConnection();
            string query = "SELECT * FROM Customers";
            SqlCommand cmd = new SqlCommand(query, conn);
            using SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                customers.Add(new Customer
                {
                    CustomerID = reader.GetInt32(0),
                    FirstName = reader.GetString(1),
                    LastName = reader.GetString(2),
                    Email = reader.GetString(3),
                    Phone = reader.GetString(4),
                    Address = reader.GetString(5)
                });
            }
            return customers;
        }
    }
}
