using System;

namespace SIS.entity
{
    public class Payment
    {
        private int paymentId;
        private int studentId;
        private double amount;
        private DateTime paymentDate;

        public int PaymentId
        {
            get => paymentId;
            set => paymentId = value;
        }

        public int StudentId
        {
            get => studentId;
            set => studentId = value;
        }

        public double Amount
        {
            get => amount;
            set
            {
                if (value < 0)
                    throw new ArgumentException("Amount cannot be negative.");
                amount = value;
            }
        }

        public DateTime PaymentDate
        {
            get => paymentDate;
            set => paymentDate = value;
        }

        // Default constructor
        public Payment() { }

        // Parameterized constructor
        public Payment(int id, int studentId, double amount, DateTime date)
        {
            PaymentId = id;
            StudentId = studentId;
            Amount = amount;
            PaymentDate = date;
        }

        public override string ToString()
        {
            return $"Payment [ID={PaymentId}, StudentID={StudentId}, Amount={Amount:C}, Date={PaymentDate.ToShortDateString()}]";
        }
    }
}
