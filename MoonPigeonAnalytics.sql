USE MoonPigeon;

-- ---------------- --
-- Group By/Having: --
-- ---------------- --

-- Which Sentiment Category Tops the Sales List, and What Occasion Is Behind Its Success? --

-- Finding best-selling sentiment --

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

-- New beginnings (id=3) is our highest selling sentiment with sales count of 348 --
-- Which occasion is most popular in that range? --

SELECT 
    co.occasion, COUNT(*) AS salescount, co.cardsentiment_id
FROM
    Sales AS s
        JOIN
    CardOccasion AS co ON s.cardoccasion_id = co.cardoccasion_id
GROUP BY co.cardoccasion_id
HAVING co.cardsentiment_id = 3
ORDER BY salescount DESC;

-- Graduation cards are most popular card occasion in the New Beginnings range. --

-- --------- --
-- Subquery: --
-- --------- --

-- What was the impact, number of sales generated, from our Valentine's email campaign? --

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
       
-- --------------- --       
-- Stored Function --
-- --------------- --

-- Order 981 says his order hasn't arrived let's see if he is entitled to a refund --

SELECT 
    sales_id,
    timestamp,
    ESTIMATEDDELIVERY(postage_id, timestamp) AS expected_delivery_date
FROM
    sales
WHERE
    sales_id = 981;

-- It is showing as late, so we will refund the customer and start a claim with Royal Mail --

-- ------- --
-- Trigger --
-- ------- --

-- Inserting the data for a new customer --

INSERT INTO Balance VALUES
(101, 1, 25);

INSERT INTO Customers VALUES
(101, 'james', 'smith', 'James.Smith@example.com', 23, 
'Baker street', 'London', 'nw1 6xe', 51.5237, -0.1585);

SELECT * FROM Customers
WHERE customer_id = 101;

DELETE FROM Customers
WHERE customer_id = 101;

DELETE FROM Balance
WHERE customer_id = 101;

-- ---------------- --
-- Stored Procedure --
-- ---------------- --

-- To find out the customer history for customer with id 36 --

CALL CustomerHistory(36);

-- ---------------- --
-- Nestled Subquery --
-- ---------------- --

-- To find whether the pre-payment balance is sufficent for the customer 40's latest order --

SELECT *
FROM vw_CardPaymentNeeded
WHERE customer_id = 40;

-- The customer will need to pay an additional £32.95 for their order --
