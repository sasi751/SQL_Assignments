mysql> SELECT Order_ID, IFNULL(Unit_Price, 0) AS Price FROM Orders;
+----------+----------+
| Order_ID | Price    |
+----------+----------+
|     1001 |   799.00 |
|     1002 |   650.00 |
|     1003 |   499.00 |
|     1004 |  1499.00 |
|     1005 |  2499.00 |
|     1006 |   299.00 |
|     1007 |   180.00 |
|     1008 |  1199.00 |
|     1009 | 15999.00 |
|     1010 |  1899.00 |
+----------+----------+
10 rows in set (0.19 sec)

mysql> SELECT Order_ID, COALESCE(Customer_Name, 'Unknown') AS Customer FROM Orders;
+----------+--------------+
| Order_ID | Customer     |
+----------+--------------+
|     1001 | RAVI KUMAR   |
|     1002 | SNEHA REDDY  |
|     1003 | ARJUN MEHTA  |
|     1004 | PRIYA SHARMA |
|     1005 | KIRAN RAO    |
|     1006 | NEHA VERMA   |
|     1007 | RAHUL DAS    |
|     1008 | ANJALI NAIR  |
|     1009 | SURESH PATEL |
|     1010 | MEENA IYER   |
+----------+--------------+
10 rows in set (0.18 sec)

mysql> SELECT COUNT(*) - COUNT(Product_Name) AS Null_Count 
    -> FROM Orders;
+------------+
| Null_Count |
+------------+
|          0 |
+------------+
1 row in set (0.03 sec)

mysql> SELECT * FROM Orders WHERE Order_Date IS NULL;
Empty set (0.14 sec)

mysql> SELECT Order_ID, (Store_Location IS NULL) AS is_missing FROM Orders;
+----------+------------+
| Order_ID | is_missing |
+----------+------------+
|     1001 |          0 |
|     1002 |          0 |
|     1003 |          0 |
|     1004 |          0 |
|     1005 |          0 |
|     1006 |          0 |
|     1007 |          0 |
|     1008 |          0 |
|     1009 |          0 |
|     1010 |          0 |
+----------+------------+
10 rows in set (0.00 sec)

mysql> SELECT Order_ID, COALESCE(Product_Name, Product_Category, 'No Description') AS Product_Info FROM Orders;
+----------+-------------------+
| Order_ID | Product_Info      |
+----------+-------------------+
|     1001 | Wireless Mouse    |
|     1002 | Basmati Rice 5kg  |
|     1003 | Men's T-Shirt     |
|     1004 | Bluetooth Speaker |
|     1005 | Mixer Grinder     |
|     1006 | Face Cream        |
|     1007 | Cooking Oil 1L    |
|     1008 | Women's Jeans     |
|     1009 | Smartphone        |
|     1010 | Pressure Cooker   |
+----------+-------------------+
10 rows in set (0.04 sec)

mysql> SELECT * FROM Orders WHERE Customer_Name IS NOT NULL;
+----------+------------+-------------+---------------+------------------+-------------------+----------+------------+--------------+----------------+------------+-----------+------------------+
| Order_ID | Order_Date | Customer_ID | Customer_Name | Product_Category | Product_Name      | Quantity | Unit_Price | Payment_Mode | Store_Location | First_Name | Last_Name | Email_ID         |
+----------+------------+-------------+---------------+------------------+-------------------+----------+------------+--------------+----------------+------------+-----------+------------------+
|     1001 | 2026-02-01 | C001        | RAVI KUMAR    | Electronics      | Wireless Mouse    |        2 |     799.00 | UPI          | Bangalore      | RAVI       | KUMAR     | ravi@gmail.com   |
|     1002 | 2026-02-02 | C002        | SNEHA REDDY   | Grocery          | Basmati Rice 5kg  |        1 |     650.00 | Credit Card  | Hyderabad      | SNEHA      | REDDY     | sneha@gmail.com  |
|     1003 | 2026-02-03 | C003        | ARJUN MEHTA   | Fashion          | Men's T-Shirt     |        3 |     499.00 | Cash         | Chennai        | ARJUN      | MEHTA     | arjun@gmail.com  |
|     1004 | 2026-02-04 | C004        | PRIYA SHARMA  | Electronics      | Bluetooth Speaker |        1 |    1499.00 | Debit Card   | Mumbai         | PRIYA      | SHARMA    | priya@gmail.com  |
|     1005 | 2026-02-05 | C005        | KIRAN RAO     | Home & Kitchen   | Mixer Grinder     |        1 |    2499.00 | UPI          | Bangalore      | KIRAN      | RAO       | kiran@gmail.com  |
|     1006 | 2026-02-06 | C006        | NEHA VERMA    | Beauty           | Face Cream        |        4 |     299.00 | Credit Card  | Delhi          | NEHA       | VERMA     | neha@gmail.com   |
|     1007 | 2026-02-07 | C007        | RAHUL DAS     | Grocery          | Cooking Oil 1L    |        5 |     180.00 | Cash         | Kolkata        | RAHUL      | DAS       | rahul@gmail.com  |
|     1008 | 2026-02-08 | C008        | ANJALI NAIR   | Fashion          | Women's Jeans     |        2 |    1199.00 | UPI          | Kochi          | ANJALI     | NAIR      | anjali@gmail.com |
|     1009 | 2026-02-09 | C009        | SURESH PATEL  | Electronics      | Smartphone        |        1 |   15999.00 | Debit Card   | Ahmedabad      | SURESH     | PATEL     | suresh@gmail.com |
|     1010 | 2026-02-10 | C010        | MEENA IYER    | Home & Kitchen   | Pressure Cooker   |        1 |    1899.00 | Credit Card  | Pune           | MEENA      | IYER      | meena@gmail.com  |
+----------+------------+-------------+---------------+------------------+-------------------+----------+------------+--------------+----------------+------------+-----------+------------------+
10 rows in set (0.10 sec)

mysql> SELECT * FROM Orders WHERE Unit_Price IS NULL OR Unit_Price = 0;
Empty set (0.14 sec)

mysql> SELECT * FROM Orders WHERE Customer_ID <=> NULL; -- Returns true if both are NULL
Empty set (0.07 sec)

mysql> -- Returns NULL if Quantity is 0 (useful to avoid division by zero errors)
mysql> SELECT Order_ID, NULLIF(Quantity, 0) FROM Orders;
+----------+---------------------+
| Order_ID | NULLIF(Quantity, 0) |
+----------+---------------------+
|     1001 |                   2 |
|     1002 |                   1 |
|     1003 |                   3 |
|     1004 |                   1 |
|     1005 |                   1 |
|     1006 |                   4 |
|     1007 |                   5 |
|     1008 |                   2 |
|     1009 |                   1 |
|     1010 |                   1 |
+----------+---------------------+
10 rows in set (0.24 sec)

mysql> SELECT IF(Store_Location = '', NULL, Store_Location) FROM Orders;
+-----------------------------------------------+
| IF(Store_Location = '', NULL, Store_Location) |
+-----------------------------------------------+
| Bangalore                                     |
| Hyderabad                                     |
| Chennai                                       |
| Mumbai                                        |
| Bangalore                                     |
| Delhi                                         |
| Kolkata                                       |
| Kochi                                         |
| Ahmedabad                                     |
| Pune                                          |
+-----------------------------------------------+
10 rows in set (0.22 sec)

mysql> SELECT Order_ID,
    ->        CASE 
    ->            WHEN Payment_Mode IS NULL THEN 'Pending'
    ->            ELSE Payment_Mode 
    ->        END AS Payment_Status
    -> FROM Orders;
+----------+----------------+
| Order_ID | Payment_Status |
+----------+----------------+
|     1001 | UPI            |
|     1002 | Credit Card    |
|     1003 | Cash           |
|     1004 | Debit Card     |
|     1005 | UPI            |
|     1006 | Credit Card    |
|     1007 | Cash           |
|     1008 | UPI            |
|     1009 | Debit Card     |
|     1010 | Credit Card    |
+----------+----------------+
10 rows in set (0.02 sec)

mysql> SELECT COUNT(Customer_ID) FROM Orders; -- Only counts rows where Customer_ID is not NULL
+--------------------+
| COUNT(Customer_ID) |
+--------------------+
|                 10 |
+--------------------+
1 row in set (0.02 sec)

mysql> SELECT AVG(Unit_Price), SUM(Unit_Price) FROM Orders;
+-----------------+-----------------+
| AVG(Unit_Price) | SUM(Unit_Price) |
+-----------------+-----------------+
|     2552.200000 |        25522.00 |
+-----------------+-----------------+
1 row in set (0.00 sec)

mysql> SELECT IFNULL(Order_Date, CURDATE()) FROM Orders;
+-------------------------------+
| IFNULL(Order_Date, CURDATE()) |
+-------------------------------+
| 2026-02-01                    |
| 2026-02-02                    |
| 2026-02-03                    |
| 2026-02-04                    |
| 2026-02-05                    |
| 2026-02-06                    |
| 2026-02-07                    |
| 2026-02-08                    |
| 2026-02-09                    |
| 2026-02-10                    |
+-------------------------------+
10 rows in set (0.00 sec)

mysql> SELECT COLUMN_NAME, IS_NULLABLE 
    -> FROM INFORMATION_SCHEMA.COLUMNS 
    -> WHERE TABLE_NAME = 'Orders' AND TABLE_SCHEMA = 'sql_pratice';
Empty set (1.47 sec)

mysql> notee;
