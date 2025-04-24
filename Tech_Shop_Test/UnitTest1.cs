using NUnit.Framework;
using System;
using System.Collections.Generic;
using TechShop.Entity;
using TechShop.DAO;

namespace TechShop.Tests
{
    [TestFixture]
    public class TechShopTests
    {
        private ICustomerDAO customerDAO;
        private IProductDAO productDAO;
        private IOrderDAO orderDAO;

        [SetUp]
        public void Setup()
        {
            customerDAO = new CustomerDAO();
            productDAO = new ProductDAO();
            orderDAO = new OrderDAO();
        }

        [Test]
        public void AddCustomer_ShouldReturnTrue()
        {
            var customer = new Customer
            {
                FirstName = "Test",
                LastName = "User",
                Email = "test@example.com",
                Phone = "9999988888",
                Address = "Test Address"
            };

            var result = customerDAO.AddCustomer(customer);
            Assert.That(result, Is.True);
        }

        [Test]
        public void GetCustomerById_ShouldReturnCustomer()
        {
            var customer = customerDAO.GetCustomerById(1); // ensure ID 1 exists
            Assert.That(customer, Is.Not.Null);
            Assert.That(customer.CustomerID, Is.EqualTo(1));
        }

        [Test]
        public void GetCustomerById_ShouldReturnNull_WhenNotExists()
        {
            var customer = customerDAO.GetCustomerById(-99);
            Assert.That(customer, Is.Null);
        }

        [Test]
        public void AddProduct_ShouldReturnTrue()
        {
            var product = new Product
            {
                ProductName = "Test Product",
                Description = "Unit testing product",
                Price = 100
            };

            var result = productDAO.AddProduct(product);
            Assert.That(result, Is.True);
        }

        [Test]
        public void GetProductById_ShouldReturnProduct()
        {
            var product = productDAO.GetProductById(1); // ensure product ID 1 exists
            Assert.That(product, Is.Not.Null);
            Assert.That(product.ProductID, Is.EqualTo(1));
        }

        [Test]
        public void PlaceOrder_ShouldReturnTrue()
        {
            var customer = customerDAO.GetCustomerById(1); // ensure exists
            Assert.That(customer, Is.Not.Null);

            var order = new Order
            {
                Customer = customer,
                OrderDate = DateTime.Now,
                TotalAmount = 199.99m
            };

            var result = orderDAO.PlaceOrder(order);
            Assert.That(result, Is.True);
        }

        [Test]
        public void CancelOrder_ShouldReturnTrue()
        {
            var customer = customerDAO.GetCustomerById(1);
            Assert.That(customer, Is.Not.Null);

            var order = new Order
            {
                Customer = customer,
                OrderDate = DateTime.Now,
                TotalAmount = 50
            };

            orderDAO.PlaceOrder(order);
            var orders = orderDAO.GetOrdersByCustomer(customer.CustomerID);
            int latestOrderId = orders[^1].OrderID;

            var result = orderDAO.CancelOrder(latestOrderId);
            Assert.That(result, Is.True);
        }

        [Test]
        public void GetOrdersByCustomer_ShouldReturnOrders()
        {
            var orders = orderDAO.GetOrdersByCustomer(1);
            Assert.That(orders, Is.Not.Null);
            Assert.That(orders.Count, Is.GreaterThanOrEqualTo(0)); // could be 0 if no orders ye
        }
        [Test]
        public void PlaceOrder_ShouldThrowArgumentNull_WhenCustomerIsNull()
        {
            var ex = Assert.Throws<ArgumentNullException>(() =>
            {
                var order = new Order
                {
                    Customer = null!, // Triggers the exception in the property setter
                    OrderDate = DateTime.Now,
                    TotalAmount = 100
                };
            });

            Assert.That(ex.ParamName, Is.EqualTo("Customer"));
        }




    }
}
