-- Subquery

SELECT 
    COUNT(*) AS NumberOfSales
FROM
    (SELECT 
        sales_id
    FROM
        Sales AS s
    JOIN ADTargeting AS a ON s.adtarget_id = a.adtarget_id
    JOIN cardoccasion AS co ON s.cardoccasion_id = co.cardoccasion_id
    WHERE
        a.adtarget_id = 1
            AND s.timestamp BETWEEN '2024-02-01' AND '2024-02-10'
            AND co.cardoccasion_id = 23) AS valentines_ad_success;

-- View

CREATE VIEW vw_giftpackage_address AS
    SELECT 
        s.sales_id,
        c.first_name,
        c.last_name,
        c.house_number,
        c.street,
        c.town,
        c.postcode,
        g.giftsection,
        g.gifttype
    FROM
        Sales s
            INNER JOIN
        Customers c ON s.customer_id = c.customer_id
            INNER JOIN
        Gift g ON s.gift_id = g.gift_id
    ORDER BY s.sales_id;

-- Nestled View

--  1st View

CREATE VIEW vw_PPCustomer AS
    SELECT 
        customer_id, balance
    FROM
        Balance
    WHERE
        pp_account = 1;
        
-- 2nd View

CREATE VIEW vw_MostRecentSale AS
    SELECT 
        s.customer_id,
        (cs.cardprice + IFNULL(g.giftprice, 0) + p.postageprice) AS OrderTotal
    FROM
        Sales AS s
            JOIN
        CardSize AS cs ON s.cardsize_id = cs.cardsize_id
            LEFT JOIN
        Gift AS g ON s.gift_id = g.gift_id
            JOIN
        postage AS p ON s.postage_id = p.postage_id
            JOIN
        (SELECT 
            customer_id, MAX(timestamp) AS MostRecentOrder
        FROM
            Sales
        GROUP BY customer_id) AS LatestOrders ON s.customer_id = LatestOrders.customer_id
            AND s.timestamp = LatestOrders.MostRecentOrder;
            
-- 3rd View (Joined)

CREATE VIEW vw_CardPaymentNeeded AS
    SELECT 
        p.customer_id,
        (p.balance - m.OrderTotal) AS OrderDifference,
        CASE
            WHEN (p.balance - m.OrderTotal) < 0 THEN 'YES'
            WHEN (p.balance - m.OrderTotal) >= 0 THEN 'NO'
            ELSE 'Error'
        END AS CardPaymentNeeded
    FROM
        vw_PPCustomer AS p
            JOIN
        vw_MostRecentSale AS m ON p.customer_id = m.customer_id;

-- Trigger: Customer Information

DELIMITER //

CREATE TRIGGER CustomerInformationCompliance
BEFORE INSERT on Customers
FOR EACH ROW
BEGIN
	SET NEW.first_name = CONCAT(UPPER(SUBSTRING(NEW.first_name,1,1)),
						LOWER(SUBSTRING(NEW.first_name FROM 2)));
	SET NEW.last_name = CONCAT(UPPER(SUBSTRING(NEW.last_name,1,1)),
						LOWER(SUBSTRING(NEW.last_name FROM 2)));
	SET NEW.email = LOWER(NEW.email);
	SET NEW.postcode = UPPER(NEW.postcode);
END//

DELIMITER ;

-- Stored Function: Calculate Estimated Delivery Date

DELIMITER //

CREATE FUNCTION EstimatedDelivery(postage_id INT, timestamp TIMESTAMP )
RETURNS DATE
DETERMINISTIC
BEGIN
DECLARE deliverytime DATE;
SET deliverytime = CASE
WHEN postage_id = 1 THEN timestamp + INTERVAL 2 DAY
WHEN postage_id = 2 THEN timestamp + INTERVAL 3 DAY
WHEN postage_id = 3 THEN timestamp + INTERVAL 4 DAY
WHEN postage_id = 4 THEN timestamp + INTERVAL 4 DAY
WHEN postage_id = 5 THEN timestamp + INTERVAL 4 DAY
ELSE NULL
END;
RETURN deliverytime;
END //

-- Stored Procedure: Customer Order History

DELIMITER //

CREATE PROCEDURE CustomerHistory(IN customerId INT)
BEGIN
    SELECT s.timestamp, 
           s.sales_id, 
           s.customer_id, 
           (cs.cardprice + IFNULL(g.giftprice, 0) + p.postageprice) AS OrderTotal
    FROM Sales AS s
    JOIN CardSize AS cs ON s.cardsize_id = cs.cardsize_id
    LEFT JOIN Gift AS g ON s.gift_id = g.gift_id
    JOIN postage AS p ON s.postage_id = p.postage_id
    WHERE s.customer_id = customerId;
END //

DELIMITER ;

-- -- Event: Daily Sales Report

SET GLOBAL event_scheduler = ON;

CREATE TABLE DailySalesReport (
    dsr_id INT NOT NULL AUTO_INCREMENT,
    reportdate DATE NOT NULL,
    salescount INT,
    salesrevenue INT,
    CONSTRAINT pk_dsr_id PRIMARY KEY (dsr_id)
);

DELIMITER //

CREATE EVENT DailySales
ON SCHEDULE EVERY 1 DAY
STARTS CURDATE() + INTERVAL 1 DAY
DO BEGIN
	INSERT INTO DailySalesReport(reportdate, salescount, salesrevenue)
    SELECT 
        CURDATE() - INTERVAL 1 DAY AS reportdate,
        COUNT(*) AS salescount, 
        SUM(cs.cardprice + IFNULL(g.giftprice, 0)) AS salesrevenue
    FROM Sales AS s
    JOIN CardSize AS cs 
    ON s.cardsize_id = cs.cardsize_id
    LEFT JOIN Gift AS g 
    ON s.gift_id = g.gift_id
    WHERE DATE(s.timestamp) = CURDATE() - INTERVAL 1 DAY;
END//

DELIMITER ;