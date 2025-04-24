using System;
using System.Collections.Generic;

namespace TechShop.Entity
{
    public class Order
    {
        private int orderID;
        private Customer customer = null!;
        private DateTime orderDate;
        private decimal totalAmount;
        private string status = "Pending"; // Default status

        public int OrderID
        {
            get => orderID;
            set => orderID = value;
        }

        public Customer Customer
        {
            get => customer;
            set => customer = value ?? throw new ArgumentNullException(nameof(Customer));
        }

        public DateTime OrderDate
        {
            get => orderDate;
            set => orderDate = value;
        }

        public decimal TotalAmount
        {
            get => totalAmount;
            set => totalAmount = value >= 0
                ? value
                : throw new ArgumentException("Total amount cannot be negative.");
        }

        public string Status
        {
            get => status;
            set => status = !string.IsNullOrWhiteSpace(value)
                ? value
                : throw new ArgumentException("Status cannot be empty.");
        }

        public Order() { }

        public Order(int orderID, Customer customer, DateTime orderDate, decimal totalAmount)
        {
            OrderID = orderID;
            Customer = customer;
            OrderDate = orderDate;
            TotalAmount = totalAmount;
        }

        public void CalculateTotalAmount(List<OrderDetail> orderDetails)
        {
            decimal total = 0;
            foreach (var detail in orderDetails)
            {
                total += detail.CalculateSubtotal();
            }
            TotalAmount = total;
        }

        public void GetOrderDetails(List<OrderDetail> orderDetails)
        {
            Console.WriteLine($"Order ID: {OrderID}, Date: {OrderDate}, Customer: {Customer.FirstName} {Customer.LastName}");
            foreach (var detail in orderDetails)
            {
                if (detail.OrderID == this.OrderID)
                    detail.GetOrderDetailInfo();
            }
            Console.WriteLine($"Total Amount: {TotalAmount:C}");
        }

        public void UpdateOrderStatus(string newStatus)
        {
            Status = newStatus;
        }

        public void CancelOrder(List<Inventory> inventory, List<OrderDetail> orderDetails)
        {
            foreach (var detail in orderDetails)
            {
                if (detail.OrderID == this.OrderID)
                {
                    var inventoryItem = inventory.Find(i => i.Product.ProductID == detail.Product.ProductID);
                    if (inventoryItem != null)
                    {
                        inventoryItem.AddToInventory(detail.Quantity);
                    }
                }
            }

            Status = "Cancelled";
            Console.WriteLine($"Order {OrderID} has been cancelled and stock has been updated.");
        }

        public override string ToString()
        {
            return $"Order [ID={OrderID}, Customer={Customer.FirstName} {Customer.LastName}, Date={OrderDate}, Amount={TotalAmount:C}, Status={Status}]";
        }
    }
}
