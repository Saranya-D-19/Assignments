using System;
using System.Collections.Generic;
using TechShop.DAO;
using TechShop.Entity;

namespace TechShop
{
    public class Program
    {
        private static readonly ICustomerDAO customerDAO = new CustomerDAO();
        private static readonly IProductDAO productDAO = new ProductDAO();
        private static readonly IOrderDAO orderDAO = new OrderDAO();

        public static void Main(string[] args)
        {
            while (true)
            {
                Console.WriteLine("\n==== TECHSHOP MENU ====");
                Console.WriteLine("1. Register Customer");
                Console.WriteLine("2. View All Customers");
                Console.WriteLine("3. Add Product");
                Console.WriteLine("4. View All Products");
                Console.WriteLine("5. Place Order");
                Console.WriteLine("6. View Orders by Customer");
                Console.WriteLine("0. Exit");
                Console.Write("Choose an option: ");

                switch (Console.ReadLine())
                {
                    case "1":
                        RegisterCustomer();
                        break;
                    case "2":
                        ListAllCustomers();
                        break;
                    case "3":
                        AddProduct();
                        break;
                    case "4":
                        ListAllProducts();
                        break;
                    case "5":
                        PlaceOrder();
                        break;
                    case "6":
                        GetOrdersByCustomer();
                        break;
                    case "0":
                        Console.WriteLine("Goodbye!");
                        return;
                    default:
                        Console.WriteLine("Invalid option. Try again.");
                        break;
                }
            }
        }

        static void RegisterCustomer()
        {
            Console.Write("First Name: ");
            string firstName = Console.ReadLine()!;
            Console.Write("Last Name: ");
            string lastName = Console.ReadLine()!;
            Console.Write("Email: ");
            string email = Console.ReadLine()!;
            Console.Write("Phone: ");
            string phone = Console.ReadLine()!;
            Console.Write("Address: ");
            string address = Console.ReadLine()!;

            Customer customer = new(0, firstName, lastName, email, phone, address);
            if (customerDAO.AddCustomer(customer))
                Console.WriteLine("Customer registered successfully.");
            else
                Console.WriteLine("Failed to register customer.");
        }

        static void ListAllCustomers()
        {
            List<Customer> customers = customerDAO.GetAllCustomers();
            foreach (var c in customers)
                Console.WriteLine(c);
        }

        static void AddProduct()
        {
            Console.Write("Product Name: ");
            string name = Console.ReadLine()!;
            Console.Write("Description: ");
            string desc = Console.ReadLine()!;
            Console.Write("Price: ");
            decimal price = decimal.Parse(Console.ReadLine()!);

            Product product = new(0, name, desc, price);
            if (productDAO.AddProduct(product))
                Console.WriteLine("Product added successfully.");
            else
                Console.WriteLine("Failed to add product.");
        }

        static void ListAllProducts()
        {
            List<Product> products = productDAO.GetAllProducts();
            foreach (var p in products)
                Console.WriteLine(p);
        }

        static void PlaceOrder()
        {
            Console.Write("Customer ID: ");
            int custId = int.Parse(Console.ReadLine()!);
            Customer? customer = customerDAO.GetCustomerById(custId);
            if (customer == null)
            {
                Console.WriteLine("Customer not found.");
                return;
            }

            Console.Write("Total Amount: ");
            decimal total = decimal.Parse(Console.ReadLine()!);

            Order order = new()
            {
                Customer = customer,
                OrderDate = DateTime.Now,
                TotalAmount = total
            };

            if (orderDAO.PlaceOrder(order))
                Console.WriteLine("Order placed.");
            else
                Console.WriteLine("Failed to place order.");
        }

        static void GetOrdersByCustomer()
        {
            Console.Write("Customer ID: ");
            int custId = int.Parse(Console.ReadLine()!);
            List<Order> orders = orderDAO.GetOrdersByCustomer(custId);
            if (orders.Count == 0)
            {
                Console.WriteLine("No orders found.");
                return;
            }

            foreach (var order in orders)
                Console.WriteLine(order);
        }
    }
}
