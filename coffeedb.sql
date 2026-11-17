-- Gertrudes Cafe — Coffee Shop Database
-- Import this into phpMyAdmin or run via mysql command line

CREATE DATABASE IF NOT EXISTS coffeedb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE coffeedb;

-- Users (sign up / sign in)
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  phone VARCHAR(20) NOT NULL,
  address TEXT NOT NULL,
  role ENUM('account','rider') NOT NULL DEFAULT 'account',
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Products (menu items)
CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  image VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Orders
CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NULL,
  customer_name VARCHAR(100) NOT NULL,
  customer_phone VARCHAR(20) NOT NULL,
  customer_address TEXT NOT NULL,
  notes TEXT DEFAULT NULL,
  subtotal DECIMAL(10,2) NOT NULL DEFAULT 0,
  delivery_fee DECIMAL(10,2) NOT NULL DEFAULT 0,
  total DECIMAL(10,2) NOT NULL DEFAULT 0,
  status ENUM('pending','preparing','delivering','completed','cancelled') NOT NULL DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Order line items
CREATE TABLE order_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  product_name VARCHAR(100) NOT NULL,
  quantity INT NOT NULL DEFAULT 1,
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Sample products matching the menu
INSERT INTO products (name, description, price, image) VALUES
('Barako Brew', 'Bold Filipino barako beans with earthy, robust notes and a strong kick — full-bodied for true coffee lovers.', 120.00, 'assets/images/products/barako-brew1.jpg'),
('Creamy Latte', 'Velvety steamed milk meets rich espresso, crowned with silky microfoam. Smooth and comforting.', 150.00, 'assets/images/products/creamy-latte.jpg'),
('Iced Caramel Macchiato', 'Cold-brewed espresso over ice with creamy milk and a golden caramel drizzle. Sweet and refreshing.', 180.00, 'assets/images/products/iced-caramel-macchiato.jpg'),
('Vanilla Latte', 'Creamy steamed milk with espresso and a hint of smooth vanilla syrup. Sweet and aromatic.', 160.00, 'assets/images/products/creamy-latte2.jpg'),
('Hazelnut Latte', 'Rich espresso blended with steamed milk and nutty hazelnut syrup. Warm, toasty, and balanced.', 170.00, 'assets/images/products/creamy-latte3.jpg');
