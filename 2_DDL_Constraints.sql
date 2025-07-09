CREATE DATABASE Sales;
USE Sales;
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(50) NOT NULL,
    Ordered_item VARCHAR(100) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE NOT NULL
);

ALTER TABLE Orders ADD order_quantity INT;
RENAME TABLE Orders TO sales_orders;
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity) VALUES
(1, 'A', 'Electronics', 'Smartphone', '9876543210', 2),
(2, 'B', 'Groceries', 'Rice Bag', '8765432109', 1),
(3, 'C', 'Clothing', 'Jeans', '7654321098', 3),
(4, 'D', 'Books', 'Notebook', '6543210987', 5),
(5, 'E', 'Electronics', 'Laptop', '5432109876', 1),
(6, 'F', 'Furniture', 'Chair', '4321098765', 4),
(7, 'G', 'Groceries', 'Wheat Flour', '3210987654', 2),
(8, 'H', 'Stationery', 'Pen Pack', '2109876543', 6),
(9, 'I', 'Electronics', 'Tablet', '1098765432', 1),
(10, 'J', 'Clothing', 'T-Shirt', '9988776655', 2);
SELECT Customer_name, Ordered_item FROM sales_orders;

-- 8. UPDATE the name of the product (e.g., change 'Tablet' to 'Smartwatch')
UPDATE sales_orders
SET Ordered_item = 'Smartwatch'
WHERE Order_Id = 9;
DROP TABLE sales_orders;
