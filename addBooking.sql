DELIMITER //
CREATE PROCEDURE AddBooking(
    IN booking_id INT,
    IN date DATE,
    IN slot_hour TIME,
    IN table_number INT,
    IN customer_id INT
)
BEGIN
    INSERT INTO Bookings (booking_id, date, slot_hours, table_number, customer_id)
    VALUES (booking_id, date, slot_hours, table_number, customer_id);
END;
//
DELIMITER ;
