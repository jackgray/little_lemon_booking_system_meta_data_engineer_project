DELIMITER //
CREATE PROCEDURE UpdateBooking(
    IN id INT,
    IN date DATE
)
BEGIN
    UPDATE Bookings
    SET date = date
    WHERE booking_id = id;
END;
//
DELIMITER ;
