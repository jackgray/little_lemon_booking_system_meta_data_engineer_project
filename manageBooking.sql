USE LittleLemonDB;
DROP PROCEDURE IF EXISTS AddValidBooking;
DROP FUNCTION IF EXISTS Validate;

DELIMITER $$

CREATE FUNCTION Validate(RecordsFound INTEGER, message VARCHAR(255)) RETURNS INTEGER DETERMINISTIC
BEGIN
    IF RecordsFound IS NOT NULL OR RecordsFound > 0 THEN
        SIGNAL SQLSTATE 'ERR0R' SET MESSAGE_TEXT = message;
    END IF;
    RETURN RecordsFound;
END$$

CREATE PROCEDURE ManageBooking(IN BookingDate DATE, IN TableNumber INT)
BEGIN
DECLARE `_rollback` BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
START TRANSACTION;
       
        SELECT Validate(COUNT(*), CONCAT("Table ", Table_Number, " is already booked"))
        FROM Bookings
        WHERE Booking_Date = BookingDate AND Table_Number = TableNumber;
       
INSERT INTO Bookings (Booking_Date, Table_Number)
VALUES (BookingDate, TableNumber);

IF `_rollback` THEN
SELECT CONCAT("Table ", Table_Number, " is already booked - booking cancelled") AS "Booking status";
ROLLBACK;
ELSE
COMMIT;
END IF;
    END$$
   
DELIMITER ;

CALL ManageBooking("2024-12-17", 6);