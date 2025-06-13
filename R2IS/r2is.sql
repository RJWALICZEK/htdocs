-- Tworzenie bazy danych
CREATE DATABASE IF NOT EXISTS r2is CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE r2is;

-- Tabela użytkowników
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela kategorii
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    parent_id INT DEFAULT NULL,
    FOREIGN KEY (parent_id) REFERENCES categories(id) ON DELETE SET NULL
);

-- Tabela produktów
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image VARCHAR(255),
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Tabela promocji
CREATE TABLE promotions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT,
    image VARCHAR(255),
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Wstawianie przykładowych kategorii
INSERT INTO categories (name, parent_id) VALUES
('Części', NULL),
('Części silnikowe', 1),
('Układ napędowy', 1),
('Zawieszenie', 1),
('Hamulce', 1),
('Elektryka', 1),
('Nadwozie i plastiki', 1),
('Koła', 1),
('Akcesoria i tuning', 1),
('Kaski', NULL),
('Kask integralny', 10),
('Kask modularny', 10),
('Kask otwarty', 10),
('Kask crossowy', 10),
('Serwis i narzędzia', NULL),
('Oleje i płyny', 15),
('Narzędzia', 15),
('Opony', 15);

-- Wstawianie przykładowych produktów
INSERT INTO products (name, description, price, image, category_id) VALUES
('Cylinder 70cc 2T', 'Cylinder tuningowy 70cc do skuterów 2-suwowych.', 199.99, 'img/cylinder.jpg', 2),
('Kask integralny X1', 'Bezpieczny kask integralny z szybą.', 299.00, 'img/kask1.jpg', 11),
('Olej silnikowy 2T', 'Wysokiej jakości olej do silników 2-suwowych.', 24.99, 'img/olej2t.jpg', 16);

-- Wstawianie przykładowej promocji
INSERT INTO promotions (title, content, image, active) VALUES
('Mega promocja na kaski!', 'Tylko teraz 20% taniej na wszystkie kaski!', 'img/slide1.png', TRUE);
