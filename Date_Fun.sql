mysql> select * from Orders;
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
10 rows in set (0.00 sec)

mysql> SELECT Order_ID, Order_Date, strftime('%Y', Order_Date) AS Year 
    -> FROM Orders;
ERROR 1305 (42000): FUNCTION sql_practice.strftime does not exist
mysql> SELECT YEAR(Order_Date) FROM Orders;
+------------------+
| YEAR(Order_Date) |
+------------------+
|             2026 |
|             2026 |
|             2026 |
|             2026 |
|             2026 |
|             2026 |
|             2026 |
|             2026 |
|             2026 |
|             2026 |
+------------------+
10 rows in set (0.90 sec)

mysql> SELECT MONTH(Order_Date) FROM Orders;
+-------------------+
| MONTH(Order_Date) |
+-------------------+
|                 2 |
|                 2 |
|                 2 |
|                 2 |
|                 2 |
|                 2 |
|                 2 |
|                 2 |
|                 2 |
|                 2 |
+-------------------+
10 rows in set (0.08 sec)

mysql> SELECT DAY(Order_Date) FROM Orders;
+-----------------+
| DAY(Order_Date) |
+-----------------+
|               1 |
|               2 |
|               3 |
|               4 |
|               5 |
|               6 |
|               7 |
|               8 |
|               9 |
|              10 |
+-----------------+
10 rows in set (0.12 sec)

mysql> SELECT CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2026-02-25 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2026-02-25 18:48:29 |
+---------------------+
1 row in set (7.81 sec)

mysql> SELECT Order_Date, DATE_ADD(Order_Date, INTERVAL 7 DAY) AS Delivery_Expected FROM Orders;
+------------+-------------------+
| Order_Date | Delivery_Expected |
+------------+-------------------+
| 2026-02-01 | 2026-02-08        |
| 2026-02-02 | 2026-02-09        |
| 2026-02-03 | 2026-02-10        |
| 2026-02-04 | 2026-02-11        |
| 2026-02-05 | 2026-02-12        |
| 2026-02-06 | 2026-02-13        |
| 2026-02-07 | 2026-02-14        |
| 2026-02-08 | 2026-02-15        |
| 2026-02-09 | 2026-02-16        |
| 2026-02-10 | 2026-02-17        |
+------------+-------------------+
10 rows in set (0.40 sec)

mysql> SELECT Order_Date, DATE_SUB(Order_Date, INTERVAL 30 DAY) AS Promo_Start FROM Orders;
+------------+-------------+
| Order_Date | Promo_Start |
+------------+-------------+
| 2026-02-01 | 2026-01-02  |
| 2026-02-02 | 2026-01-03  |
| 2026-02-03 | 2026-01-04  |
| 2026-02-04 | 2026-01-05  |
| 2026-02-05 | 2026-01-06  |
| 2026-02-06 | 2026-01-07  |
| 2026-02-07 | 2026-01-08  |
| 2026-02-08 | 2026-01-09  |
| 2026-02-09 | 2026-01-10  |
| 2026-02-10 | 2026-01-11  |
+------------+-------------+
10 rows in set (0.00 sec)

mysql> SELECT DATEDIFF(CURDATE(), Order_Date) AS Days_Since_Ordered FROM Orders;
+--------------------+
| Days_Since_Ordered |
+--------------------+
|                 24 |
|                 23 |
|                 22 |
|                 21 |
|                 20 |
|                 19 |
|                 18 |
|                 17 |
|                 16 |
|                 15 |
+--------------------+
10 rows in set (0.30 sec)

mysql> SELECT DATEDIFF - CURDATE();
ERROR 1054 (42S22): Unknown column 'DATEDIFF' in 'field list'
mysql> SELECT Order_Date - CURDATE() from Orders;
+------------------------+
| Order_Date - CURDATE() |
+------------------------+
|                    -24 |
|                    -23 |
|                    -22 |
|                    -21 |
|                    -20 |
|                    -19 |
|                    -18 |
|                    -17 |
|                    -16 |
|                    -15 |
+------------------------+
10 rows in set (0.02 sec)

mysql> SELECT abs(Order_Date - CURDATE()) from Orders;
+-----------------------------+
| abs(Order_Date - CURDATE()) |
+-----------------------------+
|                          24 |
|                          23 |
|                          22 |
|                          21 |
|                          20 |
|                          19 |
|                          18 |
|                          17 |
|                          16 |
|                          15 |
+-----------------------------+
10 rows in set (0.12 sec)

mysql> SELECT TIMESTAMPDIFF(MONTH, Order_Date, CURDATE()) AS Months_Passed FROM Orders;
+---------------+
| Months_Passed |
+---------------+
|             0 |
|             0 |
|             0 |
|             0 |
|             0 |
|             0 |
|             0 |
|             0 |
|             0 |
|             0 |
+---------------+
10 rows in set (0.02 sec)

mysql> SELECT TIMESTAMPDIFF(MONTH, '2023-01-15', '2023-03-14') AS Months;
+--------+
| Months |
+--------+
|      1 |
+--------+
1 row in set (0.04 sec)

mysql> SELECT TIMESTAMPDIFF(MONTH, '2023-01-15', '2023-07-14') AS Months;
+--------+
| Months |
+--------+
|      5 |
+--------+
1 row in set (0.02 sec)

mysql> SELECT PERIOD_DIFF(DATE_FORMAT(Order_Date, '%Y%m'), DATE_FORMAT(Order_Date, '%Y%m')) AS Months from Orders;
+--------+
| Months |
+--------+
|      0 |
|      0 |
|      0 |
|      0 |
|      0 |
|      0 |
|      0 |
|      0 |
|      0 |
|      0 |
+--------+
10 rows in set (0.07 sec)

mysql> SELECT PERIOD_DIFF(DATE_FORMAT(Order_Date, '%Y%m'), DATE_FORMAT('2019-11-11', '%Y%m')) AS Months from Orders;
+--------+
| Months |
+--------+
|     75 |
|     75 |
|     75 |
|     75 |
|     75 |
|     75 |
|     75 |
|     75 |
|     75 |
|     75 |
+--------+
10 rows in set (0.14 sec)

mysql> SELECT Order_Date, LAST_DAY(Order_Date) AS Month_End FROM Orders;
+------------+------------+
| Order_Date | Month_End  |
+------------+------------+
| 2026-02-01 | 2026-02-28 |
| 2026-02-02 | 2026-02-28 |
| 2026-02-03 | 2026-02-28 |
| 2026-02-04 | 2026-02-28 |
| 2026-02-05 | 2026-02-28 |
| 2026-02-06 | 2026-02-28 |
| 2026-02-07 | 2026-02-28 |
| 2026-02-08 | 2026-02-28 |
| 2026-02-09 | 2026-02-28 |
| 2026-02-10 | 2026-02-28 |
+------------+------------+
10 rows in set (0.04 sec)

mysql> SELECT DATE_FORMAT(Order_Date, '%d-%m-%Y') AS Formatted_Date FROM Orders;
+----------------+
| Formatted_Date |
+----------------+
| 01-02-2026     |
| 02-02-2026     |
| 03-02-2026     |
| 04-02-2026     |
| 05-02-2026     |
| 06-02-2026     |
| 07-02-2026     |
| 08-02-2026     |
| 09-02-2026     |
| 10-02-2026     |
+----------------+
10 rows in set (0.00 sec)

mysql> SELECT CAST(Order_Date AS CHAR) FROM Orders;
+--------------------------+
| CAST(Order_Date AS CHAR) |
+--------------------------+
| 2026-02-01               |
| 2026-02-02               |
| 2026-02-03               |
| 2026-02-04               |
| 2026-02-05               |
| 2026-02-06               |
| 2026-02-07               |
| 2026-02-08               |
| 2026-02-09               |
| 2026-02-10               |
+--------------------------+
10 rows in set (0.36 sec)

mysql> SELECT WEEK(Order_Date) AS Week_Num FROM Orders;
+----------+
| Week_Num |
+----------+
|        5 |
|        5 |
|        5 |
|        5 |
|        5 |
|        5 |
|        5 |
|        6 |
|        6 |
|        6 |
+----------+
10 rows in set (0.02 sec)

mysql> SELECT DAYNAME(Order_Date) AS Day_Name FROM Orders; -- e.g., 'Monday'
+-----------+
| Day_Name  |
+-----------+
| Sunday    |
| Monday    |
| Tuesday   |
| Wednesday |
| Thursday  |
| Friday    |
| Saturday  |
| Sunday    |
| Monday    |
| Tuesday   |
+-----------+
10 rows in set (0.75 sec)

mysql> SELECT QUARTER(Order_Date) AS Sales_Quarter FROM Orders;
+---------------+
| Sales_Quarter |
+---------------+
|             1 |
|             1 |
|             1 |
|             1 |
|             1 |
|             1 |
|             1 |
|             1 |
|             1 |
|             1 |
+---------------+
10 rows in set (0.73 sec)

mysql> SELECT MAKEDATE(YEAR(Order_Date), 1) AS New_Years_Day FROM Orders;
+---------------+
| New_Years_Day |
+---------------+
| 2026-01-01    |
| 2026-01-01    |
| 2026-01-01    |
| 2026-01-01    |
| 2026-01-01    |
| 2026-01-01    |
| 2026-01-01    |
| 2026-01-01    |
| 2026-01-01    |
| 2026-01-01    |
+---------------+
10 rows in set (0.61 sec)

mysql> SELECT TIMESTAMPDIFF(YEAR, '2004-11-23', CURDATE()) AS Age FROM Users;
ERROR 1146 (42S02): Table 'sql_practice.users' doesn't exist
mysql> SELECT TIMESTAMPDIFF(YEAR, '2004-11-23', CURDATE()) As Age;
+------+
| Age  |
+------+
|   21 |
+------+
1 row in set (0.00 sec)

mysql> SELECT Order_Date, 
    ->        IF(WEEKDAY(Order_Date) >= 5, 'Weekend', 'Weekday') AS Day_Type 
    -> FROM Orders;
+------------+----------+
| Order_Date | Day_Type |
+------------+----------+
| 2026-02-01 | Weekend  |
| 2026-02-02 | Weekday  |
| 2026-02-03 | Weekday  |
| 2026-02-04 | Weekday  |
| 2026-02-05 | Weekday  |
| 2026-02-06 | Weekday  |
| 2026-02-07 | Weekend  |
| 2026-02-08 | Weekend  |
| 2026-02-09 | Weekday  |
| 2026-02-10 | Weekday  |
+------------+----------+
10 rows in set (0.25 sec)

mysql> SELECT Order_Date,DATE_ADD(Order_Date, INTERVAL (8 - DAYOFWEEK(Order_Date)) % 7 + 1 DAY) AS Next_MondayFROM Orders;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Orders' at line 1
mysql> SELECT Order_Date,DATE_ADD(Order_Date, INTERVAL (8 - DAYOFWEEK(Order_Date)) % 7 + 1 DAY) AS Next_Monday FROM Orders;
+------------+-------------+
| Order_Date | Next_Monday |
+------------+-------------+
| 2026-02-01 | 2026-02-02  |
| 2026-02-02 | 2026-02-09  |
| 2026-02-03 | 2026-02-09  |
| 2026-02-04 | 2026-02-09  |
| 2026-02-05 | 2026-02-09  |
| 2026-02-06 | 2026-02-09  |
| 2026-02-07 | 2026-02-09  |
| 2026-02-08 | 2026-02-09  |
| 2026-02-09 | 2026-02-16  |
| 2026-02-10 | 2026-02-16  |
+------------+-------------+
10 rows in set (0.05 sec)

mysql> notee;
