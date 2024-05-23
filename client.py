import mysql.connector as connector


connection = connector.connect(user = "root", password = "root", db="littlelemondb")

cursor = connection.cursor()
show_tables_query = "SHOW TABLES" 
cursor.execute(show_tables_query)
results = cursor.fetchall()

for table in results:
    print(table[0])

join_query = """
SELECT customers.Name, customers.Contact, orders.TotalCost 
FROM customers 
INNER JOIN bookings ON customers.CustomerID = bookings.CustomerID
INNER JOIN orders  ON bookings.BookingID = orders.BookingID
WHERE orders.TotalCost >= 60;
"""
cursor.execute(join_query)
results = cursor.fetchall()   
cols = cursor.column_names

print(cols)
for result in results:
    print(result)

if connection.is_connected():
	cursor.close()
	connection.close()
else:
	pass
print('Connection to database is closed.')
