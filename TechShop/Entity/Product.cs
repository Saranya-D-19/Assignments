using System;

namespace TechShop.Entity
{
    public class Product
    {
        private int productID;
        private string productName = string.Empty;
        private string description = string.Empty;
        private decimal price;

        public int ProductID
        {
            get => productID;
            set => productID = value;
        }

        public string ProductName
        {
            get => productName;
            set => productName = !string.IsNullOrWhiteSpace(value)
                ? value
                : throw new ArgumentException("Product name cannot be empty.");
        }

        public string Description
        {
            get => description;
            set => description = value ?? string.Empty;
        }

        public decimal Price
        {
            get => price;
            set => price = value >= 0
                ? value
                : throw new ArgumentException("Price cannot be negative.");
        }

        // Default constructor
        public Product() { }

        // Parameterized constructor
        public Product(int productID, string productName, string description, decimal price)
        {
            ProductID = productID;
            ProductName = productName;
            Description = description;
            Price = price;
        }

        public void GetProductDetails()
        {
            Console.WriteLine(this.ToString());
        }

        public void UpdateProductInfo(string newDescription, decimal newPrice)
        {
            Description = newDescription;
            Price = newPrice;
        }

        public override string ToString()
        {
            return $"Product [ID={ProductID}, Name={ProductName}, Description={Description}, Price={Price:C}]";
        }
    }
}
