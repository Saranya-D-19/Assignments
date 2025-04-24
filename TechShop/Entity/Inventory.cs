using System;

namespace TechShop.Entity
{
    public class Inventory
    {
        private int inventoryID;
        private Product product = null!; // Safe initialization for non-nullable field
        private int quantityInStock;
        private DateTime lastStockUpdate;

        public int InventoryID
        {
            get => inventoryID;
            set => inventoryID = value;
        }

        public Product Product
        {
            get => product;
            set => product = value ?? throw new ArgumentNullException(nameof(Product));
        }

        public int QuantityInStock
        {
            get => quantityInStock;
            set => quantityInStock = value >= 0
                ? value
                : throw new ArgumentException("Quantity cannot be negative.");
        }

        public DateTime LastStockUpdate
        {
            get => lastStockUpdate;
            set => lastStockUpdate = value;
        }

        // Default constructor
        public Inventory() { }

        // Parameterized constructor
        public Inventory(int inventoryID, Product product, int quantityInStock, DateTime lastStockUpdate)
        {
            InventoryID = inventoryID;
            Product = product;
            QuantityInStock = quantityInStock;
            LastStockUpdate = lastStockUpdate;
        }

        public Product GetProduct() => Product;

        public int GetQuantityInStock() => QuantityInStock;

        public void AddToInventory(int quantity)
        {
            if (quantity <= 0)
                throw new ArgumentException("Quantity to add must be positive.");

            QuantityInStock += quantity;
            LastStockUpdate = DateTime.Now;
        }

        public void RemoveFromInventory(int quantity)
        {
            if (quantity <= 0 || quantity > QuantityInStock)
                throw new InvalidOperationException("Insufficient stock to remove the requested quantity.");

            QuantityInStock -= quantity;
            LastStockUpdate = DateTime.Now;
        }

        public void UpdateStockQuantity(int newQuantity)
        {
            if (newQuantity < 0)
                throw new ArgumentException("New quantity must be non-negative.");

            QuantityInStock = newQuantity;
            LastStockUpdate = DateTime.Now;
        }

        public bool IsProductAvailable(int quantityToCheck)
        {
            return QuantityInStock >= quantityToCheck;
        }

        public decimal GetInventoryValue()
        {
            return Product.Price * QuantityInStock;
        }

        public override string ToString()
        {
            return $"Inventory [ID={InventoryID}, Product={Product.ProductName}, Stock={QuantityInStock}, LastUpdated={LastStockUpdate}]";
        }
    }
}
