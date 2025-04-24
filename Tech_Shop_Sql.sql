

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(150),
    Phone NVARCHAR(20),
    Address NVARCHAR(200)
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100),
    Description NVARCHAR(255),
    Price DECIMAL(10,2)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Inventory table
CREATE TABLE Inventory (
    InventoryID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('Alice', 'Smith', 'alice@example.com', '9876543210', 'New York'),
('Bob', 'Jones', 'bob@example.com', '9123456789', 'Chicago'),
('Charlie', 'Brown', 'charlie@example.com', '9001122334', 'Houston'),
('Diana', 'Miller', 'diana@example.com', '9234567890', 'Dallas'),
('Evan', 'Davis', 'evan@example.com', '9011223344', 'San Jose'),
('Fiona', 'Clark', 'fiona@example.com', '9345678901', 'Austin'),
('George', 'Wright', 'george@example.com', '9223344556', 'Seattle'),
('Hannah', 'Lewis', 'hannah@example.com', '9445566778', 'Denver'),
('Ian', 'Hall', 'ian@example.com', '9556677889', 'Atlanta'),
('Julia', 'Scott', 'julia@example.com', '9667788990', 'Phoenix');

INSERT INTO Products (ProductName, Description, Price) VALUES
('Smartphone A', '5G smartphone with 128GB storage', 699.99),
('Laptop X', '14-inch ultrabook', 899.99),
('Tablet Z', '10-inch Android tablet', 349.99),
('Smartwatch S', 'Fitness tracking smartwatch', 199.99),
('Bluetooth Speaker', 'Portable speaker with bass boost', 89.99),
('Wireless Earbuds', 'Noise-cancelling earbuds', 149.99),
('Gaming Console', 'Next-gen console with 1TB SSD', 499.99),
('Monitor HD', '24-inch FHD monitor', 179.99),
('Keyboard Mechanical', 'RGB mechanical keyboard', 79.99),
('External HDD', '2TB USB 3.0 hard drive', 109.99);


INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, GETDATE(), 899.99),
(2, GETDATE(), 349.99),
(3, GETDATE(), 699.99),
(4, GETDATE(), 109.99),
(5, GETDATE(), 199.99),
(6, GETDATE(), 499.99),
(7, GETDATE(), 149.99),
(8, GETDATE(), 179.99),
(9, GETDATE(), 89.99),
(10, GETDATE(), 79.99);


INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 1, 1),
(4, 10, 1),
(5, 4, 1),
(6, 7, 1),
(7, 6, 1),
(8, 8, 1),
(9, 5, 1),
(10, 9, 1);


INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 100, GETDATE()),
(2, 50, GETDATE()),
(3, 75, GETDATE()),
(4, 60, GETDATE()),
(5, 120, GETDATE()),
(6, 80, GETDATE()),
(7, 40, GETDATE()),
(8, 90, GETDATE()),
(9, 70, GETDATE()),
(10, 65, GETDATE());



