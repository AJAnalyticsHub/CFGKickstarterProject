USE onlinecardretailer;

CREATE VIEW vw_customer_balance AS
SELECT c.customer_id, c.first_name, c.last_name, b.balance
FROM customers c
LEFT JOIN balance b ON c.customer_id=b.customer_id
ORDER BY c.customer_id;