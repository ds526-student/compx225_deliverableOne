-- Kiwi Kloset database

DROP TABLE IF EXISTS `check`;
DROP TABLE IF EXISTS `repair`;
DROP TABLE IF EXISTS booking_items;
DROP TABLE IF EXISTS booking_information;
DROP TABLE IF EXISTS availability;
DROP TABLE IF EXISTS costumes;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS branch;
DROP TABLE IF EXISTS customers;


CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL,
    `position` ENUM('manager', 'assistant') NOT NULL,
    branch_id INT NOT NULL
);

CREATE TABLE IF NOT EXISTS category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS costumes (
    costume_id INT PRIMARY KEY AUTO_INCREMENT,
    costume_name VARCHAR(100) NOT NULL,
    `description` TEXT NOT NULL,
    `size` VARCHAR(10) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS branch (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100) NOT NULL,
    `location` VARCHAR(100) NOT NULL,
    manager_id INT NULL
);

CREATE TABLE IF NOT EXISTS availability (
    branch_id INT NOT NULL,
    costume_id INT NOT NULL,
    quantity_available INT NOT NULL,
    PRIMARY KEY (branch_id, costume_id),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE,
    FOREIGN KEY (costume_id) REFERENCES costumes(costume_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS booking_information (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    booking_date DATE NOT NULL,
    hire_start_date DATE NOT NULL,
    hire_end_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS booking_items (
    booking_id INT PRIMARY KEY,
    costume_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES booking_information(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (costume_id) REFERENCES costumes(costume_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `repair` (
    repair_id INT PRIMARY KEY AUTO_INCREMENT,
    costume_id INT NOT NULL,
    staff_id INT NOT NULL,
    repair_date DATE NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (costume_id) REFERENCES costumes(costume_id) ON DELETE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `check` (
    check_id INT PRIMARY KEY AUTO_INCREMENT,
    costume_id INT NOT NULL,
    staff_id INT NOT NULL,
    check_date DATE NOT NULL,
    condition_status ENUM('good', 'damaged', 'needs cleaning') NOT NULL,
    FOREIGN KEY (costume_id) REFERENCES costumes(costume_id) ON DELETE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id) ON DELETE CASCADE
);

ALTER TABLE staff
    ADD CONSTRAINT fk_staff_branch FOREIGN KEY (branch_id) REFERENCES branch(branch_id);

ALTER TABLE branch
    ADD CONSTRAINT fk_branch_manager FOREIGN KEY (manager_id) REFERENCES staff(staff_id);