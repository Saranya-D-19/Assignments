using System;

namespace TechShop.Entity
{
    public class OrderDetail
    {
        private int orderDetailID;
        private int orderID;
        private Product product = null!;
        private int quantity;

        public int OrderDetailID
        {
            get => orderDetailID;
            set => orderDetailID = value;
        }

        public int OrderID
        {
            get => orderID;
            set => orderID = value;
        }

        public Product Product
        {
            get => product;
            set => product = value ?? throw new ArgumentNullException(nameof(Product));
        }

        public int Quantity
        {
            get => quantity;
            set => quantity = value > 0
                ? value
                : throw new ArgumentException("Quantity must be greater than 0.");
        }

        public OrderDetail() { }

        public OrderDetail(int orderDetailID, int orderID, Product product, int quantity)
        {
            OrderDetailID = orderDetailID;
            OrderID = orderID;
            Product = product;
            Quantity = quantity;
        }

        public decimal CalculateSubtotal()
        {
            return Product.Price * Quantity;
        }

        public void GetOrderDetailInfo()
        {
            Console.WriteLine($"  Product: {Product.ProductName}, Quantity: {Quantity}, Subtotal: {CalculateSubtotal():C}");
        }

        public void UpdateQuantity(int newQuantity)
        {
            if (newQuantity <= 0)
                throw new ArgumentException("Quantity must be greater than 0.");
            Quantity = newQuantity;
        }

        public void AddDiscount(decimal percentage)
        {
            if (percentage < 0 || percentage > 100)
                throw new ArgumentException("Discount must be between 0 and 100%.");

            decimal discountAmount = Product.Price * (percentage / 100);
            Product.Price -= discountAmount;
        }

        public override string ToString()
        {
            return $"OrderDetail [ID={OrderDetailID}, OrderID={OrderID}, Product={Product.ProductName}, Quantity={Quantity}, Subtotal={CalculateSubtotal():C}]";
        }
    }
}
