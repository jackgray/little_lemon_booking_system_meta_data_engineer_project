DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT MAX(Quantity) as 'Max Quantity in Order' FROM Orders;
END // 
DELIMITER ;

CALL GetMaxQuantity();