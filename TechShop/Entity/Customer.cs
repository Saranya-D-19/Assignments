public class Customer
{
    private int customerID;
    private string firstName = string.Empty;
    private string lastName = string.Empty;
    private string email = string.Empty;
    private string phone = string.Empty;
    private string address = string.Empty;

    public int CustomerID
    {
        get => customerID;
        set => customerID = value;
    }

    public string FirstName
    {
        get => firstName;
        set => firstName = value ?? throw new ArgumentNullException(nameof(FirstName));
    }

    public string LastName
    {
        get => lastName;
        set => lastName = value ?? throw new ArgumentNullException(nameof(LastName));
    }

    public string Email
    {
        get => email;
        set
        {
            if (string.IsNullOrWhiteSpace(value) || !value.Contains("@"))
                throw new ArgumentException("Invalid email address.");
            email = value;
        }
    }

    public string Phone
    {
        get => phone;
        set
        {
            if (string.IsNullOrWhiteSpace(value) || value.Length < 10)
                throw new ArgumentException("Invalid phone number.");
            phone = value;
        }
    }

    public string Address
    {
        get => address;
        set => address = value ?? throw new ArgumentNullException(nameof(Address));
    }

    // Default constructor
    public Customer() { }

    // Parameterized constructor
    public Customer(int id, string firstName, string lastName, string email, string phone, string address)
    {
        CustomerID = id;
        FirstName = firstName;
        LastName = lastName;
        Email = email;
        Phone = phone;
        Address = address;
    }

    public void GetCustomerDetails() => Console.WriteLine(this.ToString());

    public void UpdateCustomerInfo(string newEmail, string newPhone, string newAddress)
    {
        Email = newEmail;
        Phone = newPhone;
        Address = newAddress;
    }

    public override string ToString()
    {
        return $"Customer [ID={CustomerID}, Name={FirstName} {LastName}, Email={Email}, Phone={Phone}, Address={Address}]";
    }
}
