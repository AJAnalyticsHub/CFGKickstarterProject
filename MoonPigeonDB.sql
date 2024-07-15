CREATE DATABASE MoonPigeon;

USE MoonPigeon;

-- Creation of 10 tables with Primary/Foreign Keys

CREATE TABLE Balance(
customer_id INT AUTO_INCREMENT,
pp_account TINYINT(1),
balance DECIMAL(6,2),
CONSTRAINT
pk_customer_id
PRIMARY KEY
(customer_id)
);

CREATE TABLE Customers(
customer_id INT AUTO_INCREMENT,
first_name VARCHAR(55) NOT NULL,
last_name VARCHAR(55) NOT NULL,
email VARCHAR(255),
house_number INT NOT NULL,
street VARCHAR(255) NOT NULL,
town VARCHAR(255) NOT NULL,
postcode VARCHAR(10) NOT NULL,
latitude DECIMAL(6,4),
longtitude DECIMAL(6,4),
CONSTRAINT
pk_customer_id
PRIMARY KEY
(customer_id),
CONSTRAINT
fk_customer_id
FOREIGN KEY
(customer_id)
REFERENCES 
Balance(customer_id)
);

CREATE TABLE CardSentiment(
cardsentiment_id INT AUTO_INCREMENT,
cardsentiment VARCHAR(55) NOT NULL,
CONSTRAINT
pk_cardsentiment_id
PRIMARY KEY
(cardsentiment_id)
);

CREATE TABLE CardOccasion(
cardoccasion_id INT AUTO_INCREMENT,
occasion VARCHAR(55) NOT NULL,
cardsentiment_id INT NOT NULL,
CONSTRAINT
pk_cardoccasion_id
PRIMARY KEY
(cardoccasion_id),
CONSTRAINT
fk_cardsentiment_id
FOREIGN KEY
(cardsentiment_id)
REFERENCES
CardSentiment(cardsentiment_id)
);

CREATE TABLE ADTargeting(
adtarget_id INT AUTO_INCREMENT,
adtarget VARCHAR(55) NOT NULL,
CONSTRAINT
pk_adtarget_id 
PRIMARY KEY 
(adtarget_id)
);

CREATE TABLE CardSize(
cardsize_id  INT AUTO_INCREMENT,
cardsize VARCHAR(55) NOT NULL,
papersize VARCHAR(4) NOT NULL,
cardprice DECIMAL(4,2) NOT NULL,
CONSTRAINT
pk_cardsize_id
PRIMARY KEY
(cardsize_id)
);

CREATE TABLE CardTheme(
cardtheme_id INT AUTO_INCREMENT,
cardtheme VARCHAR(55) NOT NULL,
CONSTRAINT
pk_cardtheme_id
PRIMARY KEY
(cardtheme_id)
);

CREATE TABLE Gift(
gift_id INT AUTO_INCREMENT,
giftsection VARCHAR(55) NOT NULL,
gifttype VARCHAR(55) NOT NULL,
giftsize VARCHAR(55) NOT NULL,
giftprice DECIMAL(4,2) NOT NULL,
CONSTRAINT 
pk_gift_id
PRIMARY KEY
(gift_id)
);

CREATE TABLE Postage(
postage_id INT AUTO_INCREMENT,
postage VARCHAR(55) NOT NULL,
postageprice DECIMAL(4,2) NOT NULL,
CONSTRAINT 
pk_postage_id
PRIMARY KEY
(postage_id)
);

CREATE TABLE Sales(
sales_id INT AUTO_INCREMENT,
customer_id INT NOT NULL,
cardsize_id INT NOT NULL,
cardoccasion_id INT NOT NULL,
cardtheme_id INT NOT NULL,
gift_id INT,
postage_id INT NOT NULL,
adtarget_id INT NOT NULL,
timestamp DATE NOT NULL,
CONSTRAINT
pk_sales_id
PRIMARY KEY
(sales_id),
CONSTRAINT
fk_customer_id2
FOREIGN KEY
(customer_id)
REFERENCES
Customers(customer_id),
CONSTRAINT
fk_cardsize_id
FOREIGN KEY
(cardsize_id)
REFERENCES
CardSize(cardsize_id),
CONSTRAINT
fk_cardoccasion_id
FOREIGN KEY
(cardoccasion_id)
REFERENCES
CardOccasion(cardoccasion_id),
CONSTRAINT
fk_cardtheme_id
FOREIGN KEY
(cardtheme_id)
REFERENCES
CardTheme(cardtheme_id),
CONSTRAINT
fk_gift_id
FOREIGN KEY
(gift_id)
REFERENCES
Gift(gift_id),
CONSTRAINT
fk_postage_id
FOREIGN KEY
(postage_id)
REFERENCES
Postage(postage_id),
CONSTRAINT
fk_adtarget_id
FOREIGN KEY
(adtarget_id)
REFERENCES
ADTargeting(adtarget_id)
);

-- Populating smaller tables

INSERT INTO ADTargeting values
(1, 'Email'),
(2, 'Google'),
(3, 'Postal'),
(4, 'Search Engine')
;

INSERT INTO CardSentiment values
(1, 'Celebration'),
(2, 'Gratitude'),
(3, 'New Beginnings'),
(4, 'Seasonal'),
(5, 'Sympathy');

INSERT INTO CardOccasion values
(1, 'Anniversary', 1),
(2, 'Birthday', 1),
(3, 'Chinese New Year', 4),
(4, 'Christmas', 4),
(5, 'Congratulations', 1),
(6, 'Easter', 4),
(7, 'Engagement', 3),
(8, 'Fathers Day', 4),
(9, 'Get Well Soon', 5),
(10, 'Good Luck', 3),
(11, 'Graduation', 3),
(12, 'Leaving', 3),
(13, 'New Baby', 3),
(14, 'New Home', 3),
(15, 'New Job', 3),
(16, 'New Year', 4),
(17, 'Mothers Day', 4),
(18, 'Retirement', 3),
(19, 'Sympathy', 5),
(20, 'Thank You', 2),
(21, 'Thinking of You', 5),
(22, 'Thank You Teacher', 2),
(23, 'Valentines Day', 4),
(24, 'Wedding', 1);


INSERT INTO CardSize values
(1, 'Small', 'A6', 2.69),
(2, 'Standard', 'A5', 3.99),
(3, 'Large', 'A4', 5.99),
(4, 'Giant', 'A3', 9.99);

INSERT INTO CardTheme values
(1, 'Adult'),
(2, 'Celebrity'),
(3, 'Character'),
(4, 'Funny'),
(5, 'Photo Customisation'),
(6, 'Text Customisation'),
(7, 'Traditional');

INSERT INTO Gift values
(1, 'Alcohol', 'Beer Pack', 'Large', 15),
(2, 'Alcohol', 'Wine', 'Medium', 17),
(3, 'Balloons', 'Bunch', 'Large', 30),
(4, 'Balloons', 'Large', 'Medium', 15),
(5, 'Balloons', 'Small', 'Small', 10),
(6, 'Chocolate', 'Bar', 'Small', 4),
(7, 'Chocolate', 'Box', 'Medium', 12),
(8, 'Flowers', 'Large Bouquet', 'Medium', 40),
(9, 'Flowers', 'Small Bouquet', 'Medium', 25);

INSERT INTO Postage values
(1, '1st Class', 1.35),
(2, '2nd Class', 0.85),
(3, 'Small Parcel', 3.99),
(4, 'Medium Parcel', 5.49),
(5, 'Large Parcel', 7.19);

INSERT INTO Balance VALUES
(1, 1, 49.45),
(2, 0, NULL),
(3, 1, 33.33),
(4, 0, NULL),
(5, 0, NULL),
(6, 0, NULL),
(7, 0, NULL),
(8, 1, 43.50),
(9, 0, NULL),
(10, 0, NULL),
(11, 1, 1.77),
(12, 1, 49.83),
(13, 1, 34.81),
(14, 1, 2.62),
(15, 1, 25.15),
(16, 0, NULL),
(17, 1, 4.24),
(18, 0, NULL),
(19, 1, 25.98),
(20, 1, 37.48),
(21, 1, 15.94),
(22, 1, 40.92),
(23, 1, 8.05),
(24, 1, 8.28),
(25, 1, 32.02),
(26, 0, NULL),
(27, 1, 27.30),
(28, 0, NULL),
(29, 0, NULL),
(30, 1, 41.01),
(31, 1, 19.98),
(32, 0, NULL),
(33, 0, NULL),
(34, 1, 1.60),
(35, 1, 26.51),
(36, 0, NULL),
(37, 0, NULL),
(38, 1, 49.66),
(39, 0, NULL),
(40, 1, 10.23),
(41, 1, 26.56),
(42, 0, NULL),
(43, 1, 25.29),
(44, 1, 48.34),
(45, 0, NULL),
(46, 0, NULL),
(47, 0, NULL),
(48, 0, NULL),
(49, 1, 8.92),
(50, 1, 21.62),
(51, 1, 32.56),
(52, 0, NULL),
(53, 1, 40.36),
(54, 0, NULL),
(55, 1, 45.39),
(56, 1, 9.39),
(57, 0, NULL),
(58, 1, 14.94),
(59, 0, NULL),
(60, 0, NULL),
(61, 1, 43.64),
(62, 0, NULL),
(63, 1, 40.03),
(64, 0, NULL),
(65, 1, 41.92),
(66, 1, 26.37),
(67, 0, NULL),
(68, 0, NULL),
(69, 1, 14.49),
(70, 1, 43.09),
(71, 1, 13.80),
(72, 0, NULL),
(73, 1, 34.73),
(74, 0, NULL),
(75, 0, NULL),
(76, 1, 37.07),
(77, 0, NULL),
(78, 1, 37.73),
(79, 0, NULL),
(80, 0, NULL),
(81, 0, NULL),
(82, 1, 0.04),
(83, 0, NULL),
(84, 1, 4.69),
(85, 1, 0.23),
(86, 0, NULL),
(87, 0, NULL),
(88, 0, NULL),
(89, 1, 49.41),
(90, 0, NULL),
(91, 1, 6.29),
(92, 1, 6.22),
(93, 0, NULL),
(94, 0, NULL),
(95, 1, 1.43),
(96, 1, 9.49),
(97, 1, 31.31),
(98, 0, NULL),
(99, 0, NULL),
(100, 0, NULL);

INSERT INTO Customers VALUES
(1, 'Oliver', 'Smith', 'oliver.smith@example.com', 12, 'Baker Street', 'London', 'NW1 6XE', 51.5072, -0.1275),
(2, 'Amelia', 'Jones', 'amelia.jones@example.com', 34, 'High Street', 'Oxford', 'OX1 4AX', 51.7519, -1.2578),
(3, 'Harry', 'Taylor', 'harry.taylor@example.com', 56, 'Station Road', 'Cambridge', 'CB1 2JD', 52.2081, 0.1225),
(4, 'Isabella', 'Brown', 'isabella.brown@example.com', 78, 'Church Lane', 'Manchester', 'M1 4AN', 53.4667, -2.2333),
(5, 'George', 'Wilson', 'george.wilson@example.com', 90, 'Park Avenue', 'Leeds', 'LS1 5HQ', 53.7975, -1.5436),
(6, 'Emily', 'Davies', 'emily.davies@example.com', 21, 'Mill Road', 'Bristol', 'BS1 2EL', 51.4545, -2.5879),
(7, 'James', 'Evans', 'james.evans@example.com', 43, 'King Street', 'Edinburgh', 'EH1 1BB', 55.9533, -3.1892),
(8, 'Sophia', 'Thomas', 'sophia.thomas@example.com', 65, 'Queen Street', 'Glasgow', 'G1 2HL', 55.8611, -4.25),
(9, 'Michael', 'Roberts', 'michael.roberts@example.com', 87, 'Victoria Road', 'Liverpool', 'L1 3BT', 53.4075, -2.9919),
(10, 'Charlotte', 'Johnson', 'charlotte.johnson@example.com', 109, 'New Street', 'Birmingham', 'B1 1AA', 52.48, -1.9025),
(11, 'Jack', 'Walker', 'jack.walker@example.com', 112, 'Main Street', 'York', 'YO1 7QR', 53.95, -1.0833),
(12, 'Mia', 'Harris', 'mia.harris@example.com', 58, 'Broad Street', 'Bath, Somerset', 'BA1 5LR', 51.3814, -2.3586),
(13, 'Charlie', 'Clark', 'charlie.clark@example.com', 74, 'Market Street', 'Nottingham', 'NG1 6FG', 52.955, -1.1492),
(14, 'Poppy', 'Lewis', 'poppy.lewis@example.com', 89, 'Bridge Street', 'Chester', 'CH1 2NH', 53.2, -2.8833),
(15, 'Thomas', 'Robinson', 'thomas.robinson@example.com', 27, 'South Street', 'Brighton', 'BN1 3AF', 50.8208, -0.1375),
(16, 'Ava', 'Scott', 'ava.scott@example.com', 36, 'North Road', 'Plymouth', 'PL1 4FF', 50.3714, -4.1422),
(17, 'Daniel', 'Adams', 'daniel.adams@example.com', 45, 'West Street', 'Norwich', 'NR2 3DU', 52.6286, 1.2928),
(18, 'Ella', 'Hill', 'ella.hill@example.com', 59, 'East Street', 'Exeter', 'EX4 3NW', 50.7256, -3.5269),
(19, 'William', 'Green', 'william.green@example.com', 70, 'College Road', 'Durham, England', 'DH1 3LZ', 54.7833, -1.5667),
(20, 'Grace', 'Baker', 'grace.baker@example.com', 81, 'London Road', 'Sheffield', 'S1 2PP', 53.3808, -1.4703),
(21, 'Henry', 'King', 'henry.king@example.com', 93, 'Church Street', 'Newcastle upon Tyne', 'NE1 1XE', 54.9778, -1.6133),
(22, 'Freya', 'Wright', 'freya.wright@example.com', 104, 'Queens Road', 'Southampton', 'SO1 3DP', 50.9067, -1.4044),
(23, 'Alexander', 'Turner', 'alexander.turner@example.com', 29, 'Victoria Street', 'Portsmouth', 'PO1 5HA', 50.8058, -1.0872),
(24, 'Emily', 'Collins', 'emily.collins@example.com', 38, 'Oxford Street', 'Reading, Berkshire', 'RG1 7LY', 51.4542, -0.9731),
(25, 'Jacob', 'Stewart', 'jacob.stewart@example.com', 47, 'Richmond Road', 'Coventry', 'CV1 2JH', 52.4167, -1.5167),
(26, 'Jessica', 'Morris', 'jessica.morris@example.com', 56, 'Regent Street', 'Cardiff', 'CF10 2HE', 51.4817, -3.1792),
(27, 'Oscar', 'Cook', 'oscar.cook@example.com', 65, 'York Road', 'Aberdeen', 'AB10 1AN', 57.15, -2.1),
(28, 'Lily', 'Bailey', 'lily.bailey@example.com', 74, 'Park Road', 'Swansea', 'SA1 4AA', 51.6167, -3.95),
(29, 'Joshua', 'Hughes', 'joshua.hughes@example.com', 83, 'Market Place', 'Leicester', 'LE1 5GG', 52.6333, -1.1333),
(30, 'Megan', 'Morgan', 'megan.morgan@example.com', 92, 'Mill Street', 'Derby', 'DE1 3AY', 52.9217, -1.4767),
(31, 'Ethan', 'Bell', 'ethan.bell@example.com', 37, 'Castle Street', 'Lincoln, England', 'LN1 3DP', 53.25, -0.55),
(32, 'Isla', 'Foster', 'isla.foster@example.com', 24, 'Duke Street', 'Winchester', 'SO23 8UH', 51.0633, -1.3086),
(33, 'Leo', 'Carter', 'leo.carter@example.com', 51, 'Crown Street', 'Worcester', 'WR1 3JY', 52.1941, -2.2191),
(34, 'Sophie', 'Allen', 'sophie.allen@example.com', 68, 'Kingston Road', 'Guildford', 'GU1 3PT', 51.2354, -0.5746),
(35, 'Alfie', 'Wood', 'alfie.wood@example.com', 75, 'Chester Road', 'Preston, Lancashire', 'PR1 3LT', 53.7594, -2.6981),
(36, 'Chloe', 'Perry', 'chloe.perry@example.com', 19, 'Windmill Street', 'Sunderland', 'SR1 3HA', 54.9, -1.3803),
(37, 'Benjamin', 'Martin', 'benjamin.martin@example.com', 83, 'Church Road', 'Kingston upon Hull', 'HU1 1SP', 53.7444, -0.3325),
(38, 'Hannah', 'Edwards', 'hannah.edwards@example.com', 47, 'Green Lane', 'Stoke-on-Trent', 'ST1 5GH', 53, -2.1833),
(39, 'Mason', 'Murray', 'mason.murray@example.com', 52, 'Silver Street', 'Blackpool', 'FY1 3DE', 53.8167, -3.05),
(40, 'Evie', 'Clarke', 'evie.clarke@example.com', 61, 'Bridge Road', 'Luton', 'LU1 2LN', 51.8783, -0.4147),
(41, 'Lucas', 'White', 'lucas.white@example.com', 15, 'Highfield Road', 'Bradford', 'BD1 2QR', 53.794, -1.751),
(42, 'Holly', 'Harrison', 'holly.harrison@example.com', 30, 'Elm Street', 'Middlesbrough', 'TS1 3BX', 54.5742, -1.2356),
(43, 'Edward', 'Phillips', 'edward.phillips@example.com', 72, 'Cedar Avenue', 'Wolverhampton', 'WV1 3YY', 52.5833, -2.1333),
(44, 'Lucy', 'Campbell', 'lucy.campbell@example.com', 48, 'Maple Street', 'Ipswich', 'IP1 1BZ', 52.0592, 1.1551),
(45, 'Isaac', 'Mitchell', 'isaac.mitchell@example.com', 94, 'Willow Road', 'Dudley', 'DY1 1HJ', 52.5086, -2.0875),
(46, 'Erin', 'Patel', 'erin.patel@example.com', 85, 'Ash Lane', 'Woking', 'GU21 6ND', 51.3167, -0.56),
(47, 'Joseph', 'Adams', 'joseph.adams@example.com', 59, 'Birch Close', 'Stockton-on-Tees', 'TS18 3DD', 54.5667, -1.2833),
(48, 'Florence', 'Evans', 'florence.evans@example.com', 46, 'Pine Street', 'Newport', 'NP20 1FJ', 51.5877, -2.9984),
(49, 'Theodore', 'Bennett', 'theodore.bennett@example.com', 27, 'Cypress Road', 'Warrington', 'WA1 1AD', 53.392, -2.586),
(50, 'Harriet', 'Parker', 'harriet.parker@example.com', 10, 'Poplar Street', 'Southend-on-Sea', 'SS1 1XY', 51.5378, 0.7142),
(51, 'Olivia', 'Wright', 'olivia.wright@example.com', 32, 'Park Avenue', 'Leicester', 'LE1 4PH', 52.6333, -1.1333),
(52, 'Arthur', 'Scott', 'arthur.scott@example.com', 54, 'Station Road', 'Cambridge', 'CB1 3DF', 52.2081, 0.1225),
(53, 'Aria', 'Mitchell', 'aria.mitchell@example.com', 76, 'High Street', 'Oxford', 'OX1 5JW', 51.7519, -1.2578),
(54, 'Logan', 'Webb', 'logan.webb@example.com', 98, 'Queen Street', 'Glasgow', 'G1 1SL', 55.8611, -4.25),
(55, 'Layla', 'Green', 'layla.green@example.com', 45, 'Main Street', 'York', 'YO1 6LX', 53.95, -1.0833),
(56, 'Elijah', 'King', 'elijah.king@example.com', 67, 'Broad Street', 'Bath, Somerset', 'BA1 6UD', 51.3814, -2.3586),
(57, 'Amelia', 'Young', 'amelia.young@example.com', 89, 'Market Street', 'Nottingham', 'NG1 7PT', 52.955, -1.1492),
(58, 'Aiden', 'Hill', 'aiden.hill@example.com', 21, 'Bridge Street', 'Chester', 'CH1 4JG', 53.2, -2.8833),
(59, 'Penelope', 'Mitchell', 'penelope.mitchell@example.com', 43, 'South Street', 'Brighton', 'BN1 4HP', 50.8208, -0.1375),
(60, 'Mateo', 'Parker', 'mateo.parker@example.com', 65, 'North Road', 'Plymouth', 'PL1 5PY', 50.3714, -4.1422),
(61, 'Ella', 'Coleman', 'ella.coleman@example.com', 87, 'West Street', 'Norwich', 'NR2 4XT', 52.6286, 1.2928),
(62, 'Grayson', 'Lloyd', 'grayson.lloyd@example.com', 19, 'East Street', 'Exeter', 'EX4 4GL', 50.7256, -3.5269),
(63, 'Scarlett', 'Foster', 'scarlett.foster@example.com', 32, 'College Road', 'Durham, England', 'DH1 4RL', 54.7833, -1.5667),
(64, 'Lucas', 'Owen', 'lucas.owen@example.com', 54, 'London Road', 'Sheffield', 'S1 3JY', 53.3808, -1.4703),
(65, 'Stella', 'Bishop', 'stella.bishop@example.com', 76, 'Church Street', 'Newcastle upon Tyne', 'NE1 2UD', 54.9778, -1.6133),
(66, 'Jackson', 'Dixon', 'jackson.dixon@example.com', 98, 'Queens Road', 'Southampton', 'SO1 4RF', 50.9067, -1.4044),
(67, 'Nora', 'Grant', 'nora.grant@example.com', 21, 'Victoria Street', 'Portsmouth', 'PO1 6EJ', 50.8058, -1.0872),
(68, 'Levi', 'Rose', 'levi.rose@example.com', 43, 'Oxford Street', 'Reading, Berkshire', 'RG1 8UG', 51.4542, -0.9731),
(69, 'Mila', 'Stone', 'mila.stone@example.com', 65, 'Richmond Road', 'Coventry', 'CV1 3TT', 52.4167, -1.5167),
(70, 'Asher', 'Ferguson', 'asher.ferguson@example.com', 87, 'Regent Street', 'Cardiff', 'CF10 4PZ', 51.4817, -3.1792),
(71, 'Elizabeth', 'Walsh', 'elizabeth.walsh@example.com', 32, 'York Road', 'Aberdeen', 'AB10 2GW', 57.15, -2.1),
(72, 'Owen', 'Mills', 'owen.mills@example.com', 54, 'Park Road', 'Swansea', 'SA1 5TP', 51.6167, -3.95),
(73, 'Luna', 'Nicholson', 'luna.nicholson@example.com', 76, 'Market Place', 'Leicester', 'LE1 6PQ', 52.6333, -1.1333),
(74, 'Carter', 'Parker', 'carter.parker@example.com', 98, 'Mill Street', 'Derby', 'DE1 4AB', 52.9217, -1.4767),
(75, 'Nova', 'Flynn', 'nova.flynn@example.com', 21, 'Castle Street', 'Lincoln, England', 'LN1 4XT', 53.25, -0.55),
(76, 'Hunter', 'Newton', 'hunter.newton@example.com', 43, 'Duke Street', 'Winchester', 'SO23 9DN', 51.0633, -1.3086),
(77, 'Riley', 'Woods', 'riley.woods@example.com', 65, 'Crown Street', 'Worcester', 'WR1 4NY', 52.1941, -2.2191),
(78, 'Zoe', 'Barnes', 'zoe.barnes@example.com', 87, 'Kingston Road', 'Guildford', 'GU1 4TF', 51.2354, -0.5746),
(79, 'Axel', 'Fuller', 'axel.fuller@example.com', 19, 'Chester Road', 'Preston, Lancashire', 'PR1 4YA', 53.7594, -2.6981),
(80, 'Ivy', 'Hunter', 'ivy.hunter@example.com', 32, 'Windmill Street', 'Sunderland', 'SR1 4JW', 54.9, -1.3803),
(81, 'Zachary', 'Mills', 'zachary.mills@example.com', 54, 'Church Road', 'Kingston upon Hull', 'HU1 2WD', 53.7444, -0.3325),
(82, 'Madelyn', 'Ross', 'madelyn.ross@example.com', 76, 'Green Lane', 'Stoke-on-Trent', 'ST1 6TP', 53, -2.1833),
(83, 'Gavin', 'Rose', 'gavin.rose@example.com', 98, 'Silver Street', 'Blackpool', 'FY1 4PY', 53.8167, -3.05),
(84, 'Hudson', 'Newton', 'hudson.newton@example.com', 21, 'Bridge Road', 'Luton', 'LU1 4DZ', 51.8783, -0.4147),
(85, 'Claire', 'Chapman', 'claire.chapman@example.com', 43, 'Highfield Road', 'Bradford', 'BD1 3TX', 53.794, -1.751),
(86, 'Bentley', 'Baker', 'bentley.baker@example.com', 65, 'Elm Street', 'Middlesbrough', 'TS1 4AB', 54.5742, -1.2356),
(87, 'Zara', 'Barnes', 'zara.barnes@example.com', 87, 'Cedar Avenue', 'Wolverhampton', 'WV1 4YF', 52.5833, -2.1333),
(88, 'Kai', 'Hayes', 'kai.hayes@example.com', 19, 'Maple Street', 'Ipswich', 'IP1 2WQ', 52.0592, 1.1551),
(89, 'Piper', 'Mills', 'piper.mills@example.com', 32, 'Willow Road', 'Dudley', 'DY1 2DF', 52.5086, -2.0875),
(90, 'Bryson', 'Rogers', 'bryson.rogers@example.com', 54, 'Ash Lane', 'Woking', 'GU21 4ND', 51.3167, -0.56),
(91, 'Emery', 'Adams', 'emery.adams@example.com', 76, 'Birch Close', 'Stockton-on-Tees', 'TS18 4RF', 54.5667, -1.2833),
(92, 'Anastasia', 'Evans', 'anastasia.evans@example.com', 98, 'Pine Street', 'Newport', 'NP20 2QW', 51.5877, -2.9984),
(93, 'Ezekiel', 'Bennett', 'ezekiel.bennett@example.com', 21, 'Cypress Road', 'Warrington', 'WA1 2BN', 53.392, -2.586),
(94, 'Adeline', 'Parker', 'adeline.parker@example.com', 43, 'Poplar Street', 'Southend-on-Sea', 'SS1 2XY', 51.5378, 0.7142),
(95, 'Harrison', 'Wright', 'harrison.wright@example.com', 65, 'Park Avenue', 'Leicester', 'LE1 5PH', 52.6333, -1.1333),
(96, 'Aubrey', 'Scott', 'aubrey.scott@example.com', 87, 'Station Road', 'Cambridge', 'CB1 4DF', 52.2081, 0.1225),
(97, 'Brooklyn', 'Mitchell', 'brooklyn.mitchell@example.com', 19, 'High Street', 'Oxford', 'OX1 6JW', 51.7519, -1.2578),
(98, 'Eli', 'Webb', 'eli.webb@example.com', 32, 'Queen Street', 'Glasgow', 'G1 2SL', 55.8611, -4.25),
(99, 'Alyssa', 'Green', 'alyssa.green@example.com', 54, 'Main Street', 'York', 'YO1 7LX', 53.95, -1.0833),
(100, 'Hayden', 'King', 'hayden.king@example.com', 76, 'Broad Street', 'Bath, Somerset', 'BA1 7UD', 51.3814, -2.3586);

