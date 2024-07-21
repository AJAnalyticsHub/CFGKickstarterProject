USE onlinecardretailer;

-- For warehouse staff to view the orders that contain gifts and know what gift to post and where to post them --
-- Without being able to view the customers contact information --
-- It combines tables sales, customers and gift --
CREATE VIEW vw_package_adress AS
SELECT s.sales_id, 
	c.first_name, c.last_name, 
	c.house_number, c.street, 
	c.town, c.postcode, 
	s.gift_id, g.gifttype
FROM Sales s
INNER JOIN Customers c ON s.customer_id = c.customer_id
INNER JOIN Gift g ON s.gift_id = g.gift_id
ORDER BY s.sales_id;

SELECT * FROM vw_package_adress AS vw_pa
WHERE town = 'Glasgow'
ORDER BY vw_pa.first_name;

-- a trigger to standardise customer informtion --
DELIMITER //
CREATE TRIGGER fix_customer_info
BEFORE INSERT ON Customers
FOR EACH ROW
BEGIN
	SET NEW.first_name = CONCAT(UPPER(SUBSTRING(NEW.first_name,1,1)), 
						LOWER(SUBSTRING(NEW.first_name FROM 2)));
    SET NEW.last_name = CONCAT(UPPER(SUBSTRING(NEW.last_name,1,1)), 
						LOWER(SUBSTRING(NEW.last_name FROM 2)));
	SET NEW.email = LCASE(NEW.email);
	SET NEW.street = CONCAT(UPPER(SUBSTRING(NEW.street,1,1)), 
						LOWER(SUBSTRING(NEW.street FROM 2)));
    SET NEW.town = CONCAT(UCASE(LEFT(NEW.town,1)), 
					LCASE(SUBSTRING(NEW.town, 2)));
    SET NEW.postcode = UCASE(NEW.postcode);
END;
//
DELIMITER ;

INSERT INTO Customers VALUES
(101, 'james', 'smith', 'James.Smith@example.com', 23, 
'baker street', 'london', 'nw1 6xe', 51.5237, -0.1585);

DELETE FROM Customers WHERE customer_id=101; -- to demonstrate --

-- ----------- --
-- Suggestions --
-- ----------- -- 

-- Would it be easier to understand if we put which section the gift comes from rather than its id?

CREATE VIEW vw_package_adress AS
SELECT s.sales_id, c.first_name, c.last_name, c.house_number, c.street, c.town, c.postcode, g.giftsection, g.gifttype
FROM Sales s
INNER JOIN Customers c ON s.customer_id = c.customer_id
INNER JOIN Gift g ON s.gift_id = g.gift_id
ORDER BY s.sales_id;

-- I was thinking it would be helpful for a packer to have the sales_id so they can pack a certain order but what do you think?

SELECT * FROM vw_package_adress
WHERE sales_id = 340;

/* So the teacher was actually incorrect with their 1,1 thing it doesn't actually work. I ran her code myself after class and it was showing 'Yum yum' for example. 
It can be done but its pretty complicated and involves a certain statement first before the trigger. I've just updated it with the ones that have one string, because 
I thought a town like Milton Keynes might be problematic too.*/

DELIMITER //
CREATE TRIGGER fix_customer_info
BEFORE INSERT ON Customers
FOR EACH ROW
BEGIN
	SET NEW.first_name = UPPER(SUBSTRING(NEW.first_name,1)), 
						LOWER(SUBSTRING(NEW.first_name FROM 2));
    SET NEW.last_name = UPPER(SUBSTRING(NEW.last_name,1)), 
						LOWER(SUBSTRING(NEW.last_name FROM 2));
	SET NEW.email = LCASE(NEW.email);
	SET NEW.postcode = UCASE(NEW.postcode);
END;
//
DELIMITER ;

