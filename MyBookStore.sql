create database BookStore;

use BookStore;
-- Create reference tables first

CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL,
    language_code VARCHAR(10) NOT NULL
);
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(100)
);

CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_value VARCHAR(20) NOT NULL
);


CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL,
    country_code VARCHAR(10) NOT NULL
);

CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_value VARCHAR(20) NOT NULL
);

CREATE TABLE shipping_method (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL,
    cost DECIMAL(10,2) NOT NULL
);

-- Create main entity tables
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    biography TEXT
);

CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    publisher_id INT,
    language_id INT,
    num_pages INT,
    publication_date DATE,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,

    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);
CREATE TABLE customer_address (
    customer_id INT NOT NULL,
    address_id INT NOT NULL,
    status_id INT NOT NULL,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    shipping_address_id INT NOT NULL,
    method_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_address_id) REFERENCES address(address_id),
    FOREIGN KEY (method_id) REFERENCES shipping_method(method_id)
);

CREATE TABLE order_line (
    line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);


CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    status_id INT NOT NULL,
    status_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);
-- Insert reference data
INSERT INTO book_language (language_name, language_code) VALUES 
('English', 'en'), ('French', 'fr'), ('Spanish', 'es'), ('German', 'de');

INSERT INTO publisher (publisher_name, contact_info) VALUES 
('Penguin Books', 'contact@penguin.com'), 
('HarperCollins', 'info@harpercollins.com'),
('Simon & Schuster', 'support@simonandschuster.com');

INSERT INTO address_status (status_value) VALUES 
('Current'), ('Previous'), ('Billing'), ('Shipping');


INSERT INTO country (country_name, country_code) VALUES 
('United States', 'US'), ('United Kingdom', 'UK'), ('Canada', 'CA'), ('France', 'FR');

INSERT INTO order_status (status_value) VALUES 
('Pending'), ('Processing'), ('Shipped'), ('Delivered'), ('Cancelled');

INSERT INTO shipping_method (method_name, cost) VALUES 
('Standard', 5.99), ('Express', 12.99), ('Overnight', 24.99);

-- Insert sample authors
INSERT INTO author (first_name, last_name, birth_date) VALUES 
('George', 'Orwell', '1903-06-25'),
('J.K.', 'Rowling', '1965-07-31'),

('Stephen', 'King', '1947-09-21');

-- Insert sample books
INSERT INTO book (title, isbn, publisher_id, language_id, num_pages, publication_date, price, stock_quantity) VALUES 
('1984', '9780451524935', 1, 1, 328, '1950-06-08', 9.99, 50),
('Animal Farm', '9780451526342', 1, 1, 112, '1945-08-17', 7.99, 30),
('Harry Potter and the Philosopher''s Stone', '9780747532743', 2, 1, 223, '1997-06-26', 12.99, 100),
('The Shining', '9780307743657', 3, 1, 447, '1977-01-28', 14.99, 40);
-- Create customer table
CREATE TABLE customer (
    customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    PRIMARY KEY (customer_id),
    UNIQUE KEY (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert sample customers
INSERT INTO customer (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '555-123-4567'),
('Jane', 'Smith', 'jane.smith@example.com', '555-987-6543'),
('Robert', 'Johnson', 'robert.j@example.com', '555-456-7890');

-- Create address table
CREATE TABLE address (
    address_id INT NOT NULL AUTO_INCREMENT,
    street_number VARCHAR(10) NOT NULL,
    street_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country_id INT NOT NULL,
    PRIMARY KEY (address_id),
    FOREIGN KEY (country_id) REFERENCES country(country_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert sample addresses
INSERT INTO address (street_number, street_name, city, postal_code, country_id) VALUES
('123', 'Main St', 'New York', '10001', 1),
('456', 'Oak Ave', 'London', 'SW1A 1AA', 2),
('789', 'Maple Rd', 'Toronto', 'M5V 2H1', 3);

-- Create customer_address table (junction table)
CREATE TABLE customer_address (
    customer_id INT NOT NULL,
    address_id INT NOT NULL,
    status_id INT NOT NULL,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert sample customer addresses
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1),  -- John Doe's current address
(1, 2, 2),  -- John Doe's previous address
(2, 3, 1);  -- Jane Smith's current address

-- Create book_author table (many-to-many relationship)
CREATE TABLE book_author (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert sample book-author relationships
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),  -- 1984 by George Orwell
(2, 1),  -- Animal Farm by George Orwell
(3, 2),  -- Harry Potter by J.K. Rowling
(4, 3);  -- The Shining by Stephen King

-- Create cust_order table
CREATE TABLE cust_order (
    order_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    shipping_method_id INT NOT NULL,
    address_id INT NOT NULL,
    order_status_id INT NOT NULL DEFAULT 1,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(method_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(status_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert sample orders
INSERT INTO cust_order (customer_id, order_date, shipping_method_id, address_id, order_status_id) VALUES
(1, '2025-01-15 10:30:00', 1, 1, 4),  -- John Doe's delivered order
(2, '2025-02-20 14:45:00', 2, 3, 3);  -- Jane Smith's shipped order

-- Create order_line table
CREATE TABLE order_line (
    line_id INT NOT NULL AUTO_INCREMENT,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (line_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert sample order lines
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES
(1, 1, 1, 9.99),   -- John ordered 1984
(1, 3, 2, 12.99),  -- John ordered 2 Harry Potter books
(2, 4, 1, 14.99);  -- Jane ordered The Shining

-- Create order_history table
CREATE TABLE order_history (
    history_id INT NOT NULL AUTO_INCREMENT,
    order_id INT NOT NULL,
    status_id INT NOT NULL,
    status_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    PRIMARY KEY (history_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert sample order history
INSERT INTO order_history (order_id, status_id, status_date, notes) VALUES
(1, 1, '2025-01-15 10:30:00', 'Order placed'),
(1, 2, '2025-01-15 11:00:00', 'Payment received'),
(1, 3, '2025-01-16 09:15:00', 'Shipped via standard shipping'),
(1, 4, '2025-01-18 14:30:00', 'Delivered to customer'),
(2, 1, '2025-02-20 14:45:00', 'Order placed'),
(2, 2, '2025-02-20 15:30:00', 'Payment received'),
(2, 3, '2025-02-21 10:00:00', 'Shipped via express shipping');


SELECT b.title, a.first_name, a.last_name, b.price, b.stock_quantity
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id;

SELECT o.order_id, c.first_name, c.last_name, o.order_date, 
       os.status_value, sm.method_name
FROM cust_order o
JOIN customer c ON o.customer_id = c.customer_id
JOIN order_status os ON o.order_status_id = os.status_id
JOIN shipping_method sm ON o.shipping_method_id = sm.method_id;

-- Customer order totals
SELECT c.first_name, c.last_name, 
       COUNT(o.order_id) AS order_count,
       SUM(ol.quantity * ol.price) AS total_spent
FROM customer c
LEFT JOIN cust_order o ON c.customer_id = o.customer_id
LEFT JOIN order_line ol ON o.order_id = ol.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

-- Create users
CREATE USER 'leon'@'localhost' IDENTIFIED BY '123';
CREATE USER 'joy'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'edith'@'localhost' IDENTIFIED BY '12345';

-- create role
CREATE ROLE 'read_only';
CREATE ROLE 'read_write';
CREATE ROLE 'admin_full';

-- permission
GRANT select,update,insert on bookstore.* to 'admin_full';
GRANT all on bookstore.* to 'read_write';
grant select on bookstore.* to 'read_only';

-- Assign roles to users
GRANT 'admin_full' TO 'leon'@'localhost';
GRANT 'read_write' TO 'joy'@'localhost';
GRANT 'read_only' TO 'edith'@'localhost';

-- Set default role
SET DEFAULT ROLE 'admin_full' TO 'leon'@'localhost';
SET DEFAULT ROLE 'read_write' TO 'joy'@'localhost';
SET DEFAULT ROLE 'read_only' TO 'edith'@'localhost';