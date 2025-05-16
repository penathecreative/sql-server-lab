USE EcommerceDB;

CREATE VIEW OrderSummaries AS
SELECT
    u.Username,
    o.OrderID,
    o.OrderDate,
    SUM(oi.Quantity * p.Price) AS TotalAmount
FROM Orders o
JOIN Users u ON o.UserID = u.UserID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY u.Username, o.OrderID, o.OrderDate;
