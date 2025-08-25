INSERT INTO branch (branch_id, branch_name, location, manager_id)
VALUES
(1, 'Central Hamilton', 'Hamilton CBD', NULL),
(2, 'Te Rapa Outlet', 'Te Rapa, Hamilton', NULL),
(3, 'Chartwell Mall', 'Chartwell, Hamilton', NULL),
(4, 'The Base', 'Te Rapa, Hamilton', NULL);

INSERT INTO staff (staff_id, fname, lname, email, phone, position, branch_id)
VALUES
(1, 'Alice', 'Johnson', 'alice.j@kiwikloset.co.nz', '0211111111', 'Manager', 1),
(2, 'Bob', 'Smith', 'bob.s@kiwikloset.co.nz', '0212222222', 'Assistant', 1),
(3, 'Charlie', 'Brown', 'charlie.b@kiwikloset.co.nz', '0213333333', 'Manager', 2),
(4, 'Diana', 'Evans', 'diana.e@kiwikloset.co.nz', '0214444444', 'Assistant', 2),
(5, 'Ethan', 'Wright', 'ethan.w@kiwikloset.co.nz', '0215555555', 'Manager', 3),
(6, 'Fiona', 'Clark', 'fiona.c@kiwikloset.co.nz', '0216666666', 'Assistant', 3),
(7, 'George', 'Hall', 'george.h@kiwikloset.co.nz', '0217777777', 'Manager', 4),
(8, 'Holly', 'Morris', 'holly.m@kiwikloset.co.nz', '0218888888', 'Assistant', 4);

UPDATE branch SET manager_id = 1 WHERE branch_id = 1;
UPDATE branch SET manager_id = 3 WHERE branch_id = 2;
UPDATE branch SET manager_id = 5 WHERE branch_id = 3;
UPDATE branch SET manager_id = 7 WHERE branch_id = 4;

INSERT INTO customers (fname, lname, email, phone)
VALUES
('Emily', 'Taylor', 'emily.t@example.com', '0275555555'),
('Frank', 'Williams', 'frank.w@example.com', '0276666666'),
('Grace', 'Lee', 'grace.l@example.com', '0277777777'),
('Henry', 'Adams', 'henry.a@example.com', '0278888888');

INSERT INTO category (category_name)
VALUES
('Movies'),
('Historical'),
('Halloween'),
('Superheroes');

INSERT INTO costumes (costume_name, description, size, price, category_id)
VALUES
('Batman Costume', 'Classic black Batman suit with cape', 'M', 49.99, 4),
('Wonder Woman Costume', 'Red and blue suit with tiara', 'S', 39.99, 4),
('Medieval Knight', 'Armour set with sword', 'L', 59.99, 2),
('Witch Costume', 'Black dress and hat', 'M', 29.99, 3),
('Elsa Dress', 'Blue Frozen-inspired princess dress', 'S', 34.99, 1),
('Gladiator Costume', 'Roman gladiator armour and helmet', 'L', 54.99, 2),
('Vampire Cape', 'Classic vampire black & red cape', 'M', 24.99, 3),
('Spider-Man Suit', 'Red and blue Spider-Man bodysuit', 'M', 44.99, 4);

INSERT INTO availability (branch_id, costume_id, quantity_available)
VALUES
(1, 1, 5), -- Batman
(1, 4, 3), -- Witch
(1, 6, 2), -- Gladiator
(1, 7, 4), -- Vampire Cape
(2, 2, 4), -- Wonder Woman
(2, 3, 2), -- Knight
(2, 5, 6), -- Elsa
(2, 8, 3), -- Spider-Man
(3, 1, 2), -- Batman
(3, 3, 1), -- Knight
(3, 6, 3), -- Gladiator
(3, 8, 2), -- Spider-Man
(4, 4, 5), -- Witch
(4, 5, 4), -- Elsa
(4, 7, 3), -- Vampire Cape
(4, 2, 2); -- Wonder Woman

INSERT INTO booking_information (customer_id, branch_id, booking_date, hire_start_date, hire_end_date)
VALUES
(1, 1, '2025-08-20', '2025-08-25', '2025-08-28'),
(2, 2, '2025-08-21', '2025-08-27', '2025-08-30'),
(3, 3, '2025-08-22', '2025-08-29', '2025-09-01'),
(4, 4, '2025-08-23', '2025-09-01', '2025-09-04');

INSERT INTO booking_items (booking_id, costume_id, quantity, hire_start_date, hire_end_date)
VALUES
(1, 1, 1, '2025-08-25', '2025-08-28'),
(1, 4, 1, '2025-08-25', '2025-08-28'),
(2, 2, 2, '2025-08-27', '2025-08-30'),
(2, 8, 1, '2025-08-27', '2025-08-30'),
(3, 3, 1, '2025-08-29', '2025-09-01'),
(3, 6, 1, '2025-08-29', '2025-09-01'),
(4, 5, 2, '2025-09-01', '2025-09-04'),
(4, 7, 1, '2025-09-01', '2025-09-04');

INSERT INTO repair (costume_id, staff_id, repair_date, description)
VALUES
(3, 2, '2025-08-15', 'Repaired broken sword prop'),
(5, 4, '2025-08-18', 'Stitched dress seam'),
(7, 6, '2025-08-19', 'Replaced torn cape'),
(8, 8, '2025-08-20', 'Fixed mask zipper');

INSERT INTO `check` (costume_id, staff_id, check_date, condition_status)
VALUES
(1, 1, '2025-08-10', 'Good'),
(2, 3, '2025-08-12', 'Needs Repair'),
(4, 2, '2025-08-14', 'Good'),
(6, 5, '2025-08-16', 'Good');
