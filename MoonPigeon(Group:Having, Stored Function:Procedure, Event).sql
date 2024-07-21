-- Let's find our best selling sentiment category and the occasion that produces the most sales in that category.

SELECT 
    cs.cardsentiment, COUNT(*) AS salescount
FROM
    Sales AS s
        JOIN
    CardOccasion AS co ON s.cardoccasion_id = co.cardoccasion_id
        JOIN
    CardSentiment AS cs ON co.cardsentiment_id = cs.cardsentiment_id
GROUP BY cs.cardsentiment
ORDER BY salescount DESC;

-- As New beginnings (id=3) is our highest selling sentiment with sales count of 348, which occasion is most popular in that range?

SELECT 
    co.occasion, COUNT(*) AS salescount, co.cardsentiment_id
FROM
    Sales AS s
        JOIN
    CardOccasion AS co ON s.cardoccasion_id = co.cardoccasion_id
GROUP BY co.cardoccasion_id
HAVING co.cardsentiment_id = 3
ORDER BY salescount DESC;

-- Graduation cards are most popular card occasion taking into account our most popular card sentiment category

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



-- Order 981 says his order hasn't arrived let's check expected time

SELECT 
    sales_id,
    timestamp,
    ESTIMATEDDELIVERY(postage_id, timestamp) AS expected_delivery_date
FROM
    sales
WHERE
    sales_id = 981;

-- It is showing as late, so we will refund the customer and start a claim with Royal Mail

-- Stored Procedure: Customer Order History

SELECT s.timestamp, s.sales_id, s.customer_id, (cs.cardprice + IFNULL(g.giftprice,0) + p.postageprice) AS OrderTotal
FROM Sales AS s
JOIN CardSize AS cs
ON s.cardsize_id  = cs.cardsize_id
LEFT JOIN Gift AS g
ON s.gift_id = g.gift_id
JOIN postage AS p
ON s.postage_id = p.postage_id
WHERE s.customer_id = 31;

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

-- To find out the customer history for cusomer number 36

CALL CustomerHistory(36);

-- Event: Daily Sales Report

SET GLOBAL event_scheduler = ON;

CREATE TABLE DailySalesReport(
dsr_id INT NOT NULL AUTO_INCREMENT, 
reportdate DATE NOT NULL,
salescount INT,
salesrevenue INT,
CONSTRAINT
pk_dsr_id
PRIMARY KEY
(dsr_id)
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

