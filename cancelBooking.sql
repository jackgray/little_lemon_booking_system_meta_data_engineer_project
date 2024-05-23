DELIMITER //
CREATE PROCEDURE CancelBooking(
    IN BookingID INT,
    IN date DATE
)
BEGIN
    DELETE FROM Bookings
    WHERE booking_id = BookingID;
END;
//
DELIMITER ;
