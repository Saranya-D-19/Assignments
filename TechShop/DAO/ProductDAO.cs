using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using TechShop.Entity;
using TechShop.Util;

namespace TechShop.DAO
{
    public class ProductDAO : IProductDAO
    {
        public bool AddProduct(Product product)
        {
            using SqlConnection conn = Connection.GetConnection();
            string query = "INSERT INTO Products (ProductName, Description, Price) VALUES (@name, @desc, @price)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@name", product.ProductName);
            cmd.Parameters.AddWithValue("@desc", product.Description);
            cmd.Parameters.AddWithValue("@price", product.Price);
            return cmd.ExecuteNonQuery() > 0;
        }

        public bool UpdateProduct(Product product)
        {
            using SqlConnection conn = Connection.GetConnection();
            string query = "UPDATE Products SET ProductName = @name, Description = @desc, Price = @price WHERE ProductID = @id";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@name", product.ProductName);
            cmd.Parameters.AddWithValue("@desc", product.Description);
            cmd.Parameters.AddWithValue("@price", product.Price);
            cmd.Parameters.AddWithValue("@id", product.ProductID);
            return cmd.ExecuteNonQuery() > 0;
        }

        public bool DeleteProduct(int productId)
        {
            using SqlConnection conn = Connection.GetConnection();
            string query = "DELETE FROM Products WHERE ProductID = @id";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@id", productId);
            return cmd.ExecuteNonQuery() > 0;
        }

        public Product? GetProductById(int productId)
        {
            using SqlConnection conn = Connection.GetConnection();
            string query = "SELECT * FROM Products WHERE ProductID = @id";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@id", productId);
            using SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                return new Product
                {
                    ProductID = reader.GetInt32(0),
                    ProductName = reader.GetString(1),
                    Description = reader.GetString(2),
                    Price = reader.GetDecimal(3)
                };
            }
            return null;
        }

        public List<Product> GetAllProducts()
        {
            List<Product> products = new();
            using SqlConnection conn = Connection.GetConnection();
            string query = "SELECT * FROM Products";
            SqlCommand cmd = new SqlCommand(query, conn);
            using SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                products.Add(new Product
                {
                    ProductID = reader.GetInt32(0),
                    ProductName = reader.GetString(1),
                    Description = reader.GetString(2),
                    Price = reader.GetDecimal(3)
                });
            }
            return products;
        }
    }
}
