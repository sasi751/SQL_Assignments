mysql> use sql_pratice;
ERROR 1049 (42000): Unknown database 'sql_pratice'
mysql> use sql_Pratice;
ERROR 1049 (42000): Unknown database 'sql_pratice'
mysql> use sql_practice;
Database changed
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
10 rows in set (1.11 sec)

mysql> SELECT *, ROW_NUMBER() OVER(ORDER BY Order_ID) AS Row_Num FROM Orders;
+----------+------------+-------------+---------------+------------------+-------------------+----------+------------+--------------+----------------+------------+-----------+------------------+---------+
| Order_ID | Order_Date | Customer_ID | Customer_Name | Product_Category | Product_Name      | Quantity | Unit_Price | Payment_Mode | Store_Location | First_Name | Last_Name | Email_ID         | Row_Num |
+----------+------------+-------------+---------------+------------------+-------------------+----------+------------+--------------+----------------+------------+-----------+------------------+---------+
|     1001 | 2026-02-01 | C001        | RAVI KUMAR    | Electronics      | Wireless Mouse    |        2 |     799.00 | UPI          | Bangalore      | RAVI       | KUMAR     | ravi@gmail.com   |       1 |
|     1002 | 2026-02-02 | C002        | SNEHA REDDY   | Grocery          | Basmati Rice 5kg  |        1 |     650.00 | Credit Card  | Hyderabad      | SNEHA      | REDDY     | sneha@gmail.com  |       2 |
|     1003 | 2026-02-03 | C003        | ARJUN MEHTA   | Fashion          | Men's T-Shirt     |        3 |     499.00 | Cash         | Chennai        | ARJUN      | MEHTA     | arjun@gmail.com  |       3 |
|     1004 | 2026-02-04 | C004        | PRIYA SHARMA  | Electronics      | Bluetooth Speaker |        1 |    1499.00 | Debit Card   | Mumbai         | PRIYA      | SHARMA    | priya@gmail.com  |       4 |
|     1005 | 2026-02-05 | C005        | KIRAN RAO     | Home & Kitchen   | Mixer Grinder     |        1 |    2499.00 | UPI          | Bangalore      | KIRAN      | RAO       | kiran@gmail.com  |       5 |
|     1006 | 2026-02-06 | C006        | NEHA VERMA    | Beauty           | Face Cream        |        4 |     299.00 | Credit Card  | Delhi          | NEHA       | VERMA     | neha@gmail.com   |       6 |
|     1007 | 2026-02-07 | C007        | RAHUL DAS     | Grocery          | Cooking Oil 1L    |        5 |     180.00 | Cash         | Kolkata        | RAHUL      | DAS       | rahul@gmail.com  |       7 |
|     1008 | 2026-02-08 | C008        | ANJALI NAIR   | Fashion          | Women's Jeans     |        2 |    1199.00 | UPI          | Kochi          | ANJALI     | NAIR      | anjali@gmail.com |       8 |
|     1009 | 2026-02-09 | C009        | SURESH PATEL  | Electronics      | Smartphone        |        1 |   15999.00 | Debit Card   | Ahmedabad      | SURESH     | PATEL     | suresh@gmail.com |       9 |
|     1010 | 2026-02-10 | C010        | MEENA IYER    | Home & Kitchen   | Pressure Cooker   |        1 |    1899.00 | Credit Card  | Pune           | MEENA      | IYER      | meena@gmail.com  |      10 |
+----------+------------+-------------+---------------+------------------+-------------------+----------+------------+--------------+----------------+------------+-----------+------------------+---------+
10 rows in set (0.43 sec)

mysql> SELECT Product_Name, Unit_Price, RANK() OVER(ORDER BY Unit_Price DESC) AS Price_Rank FROM Orders;
+-------------------+------------+------------+
| Product_Name      | Unit_Price | Price_Rank |
+-------------------+------------+------------+
| Smartphone        |   15999.00 |          1 |
| Mixer Grinder     |    2499.00 |          2 |
| Pressure Cooker   |    1899.00 |          3 |
| Bluetooth Speaker |    1499.00 |          4 |
| Women's Jeans     |    1199.00 |          5 |
| Wireless Mouse    |     799.00 |          6 |
| Basmati Rice 5kg  |     650.00 |          7 |
| Men's T-Shirt     |     499.00 |          8 |
| Face Cream        |     299.00 |          9 |
| Cooking Oil 1L    |     180.00 |         10 |
+-------------------+------------+------------+
10 rows in set (0.02 sec)

mysql> SELECT Product_Name, (Quantity * Unit_Price) AS Sales, DENSE_RANK() OVER(ORDER BY (Quantity * Unit_Price) DESC) AS Sales_Rank FROM Orders;
+-------------------+----------+------------+
| Product_Name      | Sales    | Sales_Rank |
+-------------------+----------+------------+
| Smartphone        | 15999.00 |          1 |
| Mixer Grinder     |  2499.00 |          2 |
| Women's Jeans     |  2398.00 |          3 |
| Pressure Cooker   |  1899.00 |          4 |
| Wireless Mouse    |  1598.00 |          5 |
| Bluetooth Speaker |  1499.00 |          6 |
| Men's T-Shirt     |  1497.00 |          7 |
| Face Cream        |  1196.00 |          8 |
| Cooking Oil 1L    |   900.00 |          9 |
| Basmati Rice 5kg  |   650.00 |         10 |
+-------------------+----------+------------+
10 rows in set (0.09 sec)

mysql> SELECT Order_Date, SUM(Quantity * Unit_Price) OVER(PARTITION BY MONTH(Order_Date) ORDER BY Order_Date) AS Monthly_Cum_Sum FROM Orders;
+------------+-----------------+
| Order_Date | Monthly_Cum_Sum |
+------------+-----------------+
| 2026-02-01 |         1598.00 |
| 2026-02-02 |         2248.00 |
| 2026-02-03 |         3745.00 |
| 2026-02-04 |         5244.00 |
| 2026-02-05 |         7743.00 |
| 2026-02-06 |         8939.00 |
| 2026-02-07 |         9839.00 |
| 2026-02-08 |        12237.00 |
| 2026-02-09 |        28236.00 |
| 2026-02-10 |        30135.00 |
+------------+-----------------+
10 rows in set (0.21 sec)

mysql> SELECT Order_Date, AVG(Quantity * Unit_Price) OVER(ORDER BY Order_Date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Moving_Avg FROM Orders;
+------------+-------------+
| Order_Date | Moving_Avg  |
+------------+-------------+
| 2026-02-01 | 1598.000000 |
| 2026-02-02 | 1124.000000 |
| 2026-02-03 | 1248.333333 |
| 2026-02-04 | 1215.333333 |
| 2026-02-05 | 1831.666667 |
| 2026-02-06 | 1731.333333 |
| 2026-02-07 | 1531.666667 |
| 2026-02-08 | 1498.000000 |
| 2026-02-09 | 6432.333333 |
| 2026-02-10 | 6765.333333 |
+------------+-------------+
10 rows in set (0.00 sec)

mysql> SELECT Order_Date, (Quantity * Unit_Price) AS Sales, LAG(Quantity * Unit_Price) OVER(ORDER BY Order_Date) AS Prev_Day_Sales FROM Orders;
+------------+----------+----------------+
| Order_Date | Sales    | Prev_Day_Sales |
+------------+----------+----------------+
| 2026-02-01 |  1598.00 |           NULL |
| 2026-02-02 |   650.00 |        1598.00 |
| 2026-02-03 |  1497.00 |         650.00 |
| 2026-02-04 |  1499.00 |        1497.00 |
| 2026-02-05 |  2499.00 |        1499.00 |
| 2026-02-06 |  1196.00 |        2499.00 |
| 2026-02-07 |   900.00 |        1196.00 |
| 2026-02-08 |  2398.00 |         900.00 |
| 2026-02-09 | 15999.00 |        2398.00 |
| 2026-02-10 |  1899.00 |       15999.00 |
+------------+----------+----------------+
10 rows in set (0.17 sec)

mysql> SELECT Order_Date, (Quantity * Unit_Price) AS Sales, LEAD(Quantity * Unit_Price) OVER(ORDER BY Order_Date) AS Next_Day_Sales FROM Orders;
+------------+----------+----------------+
| Order_Date | Sales    | Next_Day_Sales |
+------------+----------+----------------+
| 2026-02-01 |  1598.00 |         650.00 |
| 2026-02-02 |   650.00 |        1497.00 |
| 2026-02-03 |  1497.00 |        1499.00 |
| 2026-02-04 |  1499.00 |        2499.00 |
| 2026-02-05 |  2499.00 |        1196.00 |
| 2026-02-06 |  1196.00 |         900.00 |
| 2026-02-07 |   900.00 |        2398.00 |
| 2026-02-08 |  2398.00 |       15999.00 |
| 2026-02-09 | 15999.00 |        1899.00 |
| 2026-02-10 |  1899.00 |           NULL |
+------------+----------+----------------+
10 rows in set (0.01 sec)

mysql> SELECT Order_Date, (Quantity * Unit_Price) - LAG(Quantity * Unit_Price) OVER(ORDER BY Order_Date) AS Sales_Diff FROM Orders;
+------------+------------+
| Order_Date | Sales_Diff |
+------------+------------+
| 2026-02-01 |       NULL |
| 2026-02-02 |    -948.00 |
| 2026-02-03 |     847.00 |
| 2026-02-04 |       2.00 |
| 2026-02-05 |    1000.00 |
| 2026-02-06 |   -1303.00 |
| 2026-02-07 |    -296.00 |
| 2026-02-08 |    1498.00 |
| 2026-02-09 |   13601.00 |
| 2026-02-10 |  -14100.00 |
+------------+------------+
10 rows in set (0.03 sec)

mysql> SELECT Store_Location, Product_Name, SUM(Quantity * Unit_Price) OVER(PARTITION BY Store_Location) AS Regional_Total FROM Orders
    -> ;
+----------------+-------------------+----------------+
| Store_Location | Product_Name      | Regional_Total |
+----------------+-------------------+----------------+
| Ahmedabad      | Smartphone        |       15999.00 |
| Bangalore      | Wireless Mouse    |        4097.00 |
| Bangalore      | Mixer Grinder     |        4097.00 |
| Chennai        | Men's T-Shirt     |        1497.00 |
| Delhi          | Face Cream        |        1196.00 |
| Hyderabad      | Basmati Rice 5kg  |         650.00 |
| Kochi          | Women's Jeans     |        2398.00 |
| Kolkata        | Cooking Oil 1L    |         900.00 |
| Mumbai         | Bluetooth Speaker |        1499.00 |
| Pune           | Pressure Cooker   |        1899.00 |
+----------------+-------------------+----------------+
10 rows in set (0.04 sec)

mysql> SELECT * FROM (SELECT *, RANK() OVER(PARTITION BY Product_Category ORDER BY (Quantity * Unit_Price) DESC) AS rnk FROM Orders) t WHERE rnk <= 3;
+----------+------------+-------------+---------------+------------------+-------------------+----------+------------+--------------+----------------+------------+-----------+------------------+-----+
| Order_ID | Order_Date | Customer_ID | Customer_Name | Product_Category | Product_Name      | Quantity | Unit_Price | Payment_Mode | Store_Location | First_Name | Last_Name | Email_ID         | rnk |
+----------+------------+-------------+---------------+------------------+-------------------+----------+------------+--------------+----------------+------------+-----------+------------------+-----+
|     1006 | 2026-02-06 | C006        | NEHA VERMA    | Beauty           | Face Cream        |        4 |     299.00 | Credit Card  | Delhi          | NEHA       | VERMA     | neha@gmail.com   |   1 |
|     1009 | 2026-02-09 | C009        | SURESH PATEL  | Electronics      | Smartphone        |        1 |   15999.00 | Debit Card   | Ahmedabad      | SURESH     | PATEL     | suresh@gmail.com |   1 |
|     1001 | 2026-02-01 | C001        | RAVI KUMAR    | Electronics      | Wireless Mouse    |        2 |     799.00 | UPI          | Bangalore      | RAVI       | KUMAR     | ravi@gmail.com   |   2 |
|     1004 | 2026-02-04 | C004        | PRIYA SHARMA  | Electronics      | Bluetooth Speaker |        1 |    1499.00 | Debit Card   | Mumbai         | PRIYA      | SHARMA    | priya@gmail.com  |   3 |
|     1008 | 2026-02-08 | C008        | ANJALI NAIR   | Fashion          | Women's Jeans     |        2 |    1199.00 | UPI          | Kochi          | ANJALI     | NAIR      | anjali@gmail.com |   1 |
|     1003 | 2026-02-03 | C003        | ARJUN MEHTA   | Fashion          | Men's T-Shirt     |        3 |     499.00 | Cash         | Chennai        | ARJUN      | MEHTA     | arjun@gmail.com  |   2 |
|     1007 | 2026-02-07 | C007        | RAHUL DAS     | Grocery          | Cooking Oil 1L    |        5 |     180.00 | Cash         | Kolkata        | RAHUL      | DAS       | rahul@gmail.com  |   1 |
|     1002 | 2026-02-02 | C002        | SNEHA REDDY   | Grocery          | Basmati Rice 5kg  |        1 |     650.00 | Credit Card  | Hyderabad      | SNEHA      | REDDY     | sneha@gmail.com  |   2 |
|     1005 | 2026-02-05 | C005        | KIRAN RAO     | Home & Kitchen   | Mixer Grinder     |        1 |    2499.00 | UPI          | Bangalore      | KIRAN      | RAO       | kiran@gmail.com  |   1 |
|     1010 | 2026-02-10 | C010        | MEENA IYER    | Home & Kitchen   | Pressure Cooker   |        1 |    1899.00 | Credit Card  | Pune           | MEENA      | IYER      | meena@gmail.com  |   2 |
+----------+------------+-------------+---------------+------------------+-------------------+----------+------------+--------------+----------------+------------+-----------+------------------+-----+
10 rows in set (0.49 sec)

mysql> SELECT * FROM (SELECT Customer_Name, SUM(Quantity * Unit_Price) AS Total, RANK() OVER(ORDER BY SUM(Quantity * Unit_Price) ASC) AS rnk FROM Orders GROUP BY Customer_Name) t WHERE rnk <= 2;
+---------------+--------+-----+
| Customer_Name | Total  | rnk |
+---------------+--------+-----+
| SNEHA REDDY   | 650.00 |   1 |
| RAHUL DAS     | 900.00 |   2 |
+---------------+--------+-----+
2 rows in set (0.09 sec)

mysql> select * from Oders order by (Quantity * Unit_Price) ASC limit 2;
ERROR 1146 (42S02): Table 'sql_practice.oders' doesn't exist
mysql> select * from Orders order by (Quantity * Unit_Price) ASC limit 2;
+----------+------------+-------------+---------------+------------------+------------------+----------+------------+--------------+----------------+------------+-----------+-----------------+
| Order_ID | Order_Date | Customer_ID | Customer_Name | Product_Category | Product_Name     | Quantity | Unit_Price | Payment_Mode | Store_Location | First_Name | Last_Name | Email_ID        |
+----------+------------+-------------+---------------+------------------+------------------+----------+------------+--------------+----------------+------------+-----------+-----------------+
|     1002 | 2026-02-02 | C002        | SNEHA REDDY   | Grocery          | Basmati Rice 5kg |        1 |     650.00 | Credit Card  | Hyderabad      | SNEHA      | REDDY     | sneha@gmail.com |
|     1007 | 2026-02-07 | C007        | RAHUL DAS     | Grocery          | Cooking Oil 1L   |        5 |     180.00 | Cash         | Kolkata        | RAHUL      | DAS       | rahul@gmail.com |
+----------+------------+-------------+---------------+------------------+------------------+----------+------------+--------------+----------------+------------+-----------+-----------------+
2 rows in set (0.00 sec)

mysql> SELECT Order_ID, (Quantity * Unit_Price) * 100 / SUM(Quantity * Unit_Price) OVER() AS Perc_Of_Total FROM Orders;
+----------+---------------+
| Order_ID | Perc_Of_Total |
+----------+---------------+
|     1001 |      5.302804 |
|     1002 |      2.156960 |
|     1003 |      4.967646 |
|     1004 |      4.974282 |
|     1005 |      8.292683 |
|     1006 |      3.968807 |
|     1007 |      2.986560 |
|     1008 |      7.957524 |
|     1009 |     53.091090 |
|     1010 |      6.301643 |
+----------+---------------+
10 rows in set (0.02 sec)

mysql> SELECT * FROM (SELECT *, ROW_NUMBER() OVER(PARTITION BY Customer_ID ORDER BY Order_Date ASC) AS rnk FROM Orders) t WHERE rnk = 1;
+----------+------------+-------------+---------------+------------------+-------------------+----------+------------+--------------+----------------+------------+-----------+------------------+-----+
| Order_ID | Order_Date | Customer_ID | Customer_Name | Product_Category | Product_Name      | Quantity | Unit_Price | Payment_Mode | Store_Location | First_Name | Last_Name | Email_ID         | rnk |
+----------+------------+-------------+---------------+------------------+-------------------+----------+------------+--------------+----------------+------------+-----------+------------------+-----+
|     1001 | 2026-02-01 | C001        | RAVI KUMAR    | Electronics      | Wireless Mouse    |        2 |     799.00 | UPI          | Bangalore      | RAVI       | KUMAR     | ravi@gmail.com   |   1 |
|     1002 | 2026-02-02 | C002        | SNEHA REDDY   | Grocery          | Basmati Rice 5kg  |        1 |     650.00 | Credit Card  | Hyderabad      | SNEHA      | REDDY     | sneha@gmail.com  |   1 |
|     1003 | 2026-02-03 | C003        | ARJUN MEHTA   | Fashion          | Men's T-Shirt     |        3 |     499.00 | Cash         | Chennai        | ARJUN      | MEHTA     | arjun@gmail.com  |   1 |
|     1004 | 2026-02-04 | C004        | PRIYA SHARMA  | Electronics      | Bluetooth Speaker |        1 |    1499.00 | Debit Card   | Mumbai         | PRIYA      | SHARMA    | priya@gmail.com  |   1 |
|     1005 | 2026-02-05 | C005        | KIRAN RAO     | Home & Kitchen   | Mixer Grinder     |        1 |    2499.00 | UPI          | Bangalore      | KIRAN      | RAO       | kiran@gmail.com  |   1 |
|     1006 | 2026-02-06 | C006        | NEHA VERMA    | Beauty           | Face Cream        |        4 |     299.00 | Credit Card  | Delhi          | NEHA       | VERMA     | neha@gmail.com   |   1 |
|     1007 | 2026-02-07 | C007        | RAHUL DAS     | Grocery          | Cooking Oil 1L    |        5 |     180.00 | Cash         | Kolkata        | RAHUL      | DAS       | rahul@gmail.com  |   1 |
|     1008 | 2026-02-08 | C008        | ANJALI NAIR   | Fashion          | Women's Jeans     |        2 |    1199.00 | UPI          | Kochi          | ANJALI     | NAIR      | anjali@gmail.com |   1 |
|     1009 | 2026-02-09 | C009        | SURESH PATEL  | Electronics      | Smartphone        |        1 |   15999.00 | Debit Card   | Ahmedabad      | SURESH     | PATEL     | suresh@gmail.com |   1 |
|     1010 | 2026-02-10 | C010        | MEENA IYER    | Home & Kitchen   | Pressure Cooker   |        1 |    1899.00 | Credit Card  | Pune           | MEENA      | IYER      | meena@gmail.com  |   1 |
+----------+------------+-------------+---------------+------------------+-------------------+----------+------------+--------------+----------------+------------+-----------+------------------+-----+
10 rows in set (0.09 sec)

mysql> SELECT Customer_Name, NTILE(4) OVER(ORDER BY (Quantity * Unit_Price) DESC) AS Quartile FROM Orders;
+---------------+----------+
| Customer_Name | Quartile |
+---------------+----------+
| SURESH PATEL  |        1 |
| KIRAN RAO     |        1 |
| ANJALI NAIR   |        1 |
| MEENA IYER    |        2 |
| RAVI KUMAR    |        2 |
| PRIYA SHARMA  |        2 |
| ARJUN MEHTA   |        3 |
| NEHA VERMA    |        3 |
| RAHUL DAS     |        4 |
| SNEHA REDDY   |        4 |
+---------------+----------+
10 rows in set (0.03 sec)

mysql> SELECT Product_Category, Product_Name, AVG(Quantity * Unit_Price) OVER(PARTITION BY Product_Category) AS Avg_Category_Sales FROM Orders;
+------------------+-------------------+--------------------+
| Product_Category | Product_Name      | Avg_Category_Sales |
+------------------+-------------------+--------------------+
| Beauty           | Face Cream        |        1196.000000 |
| Electronics      | Wireless Mouse    |        6365.333333 |
| Electronics      | Bluetooth Speaker |        6365.333333 |
| Electronics      | Smartphone        |        6365.333333 |
| Fashion          | Men's T-Shirt     |        1947.500000 |
| Fashion          | Women's Jeans     |        1947.500000 |
| Grocery          | Basmati Rice 5kg  |         775.000000 |
| Grocery          | Cooking Oil 1L    |         775.000000 |
| Home & Kitchen   | Mixer Grinder     |        2199.000000 |
| Home & Kitchen   | Pressure Cooker   |        2199.000000 |
+------------------+-------------------+--------------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM (SELECT *, ROW_NUMBER() OVER(PARTITION BY Customer_ID ORDER BY Order_Date DESC) AS rnk FROM Orders) t WHERE rnk = 1;
+----------+------------+-------------+---------------+------------------+-------------------+----------+------------+--------------+----------------+------------+-----------+------------------+-----+
| Order_ID | Order_Date | Customer_ID | Customer_Name | Product_Category | Product_Name      | Quantity | Unit_Price | Payment_Mode | Store_Location | First_Name | Last_Name | Email_ID         | rnk |
+----------+------------+-------------+---------------+------------------+-------------------+----------+------------+--------------+----------------+------------+-----------+------------------+-----+
|     1001 | 2026-02-01 | C001        | RAVI KUMAR    | Electronics      | Wireless Mouse    |        2 |     799.00 | UPI          | Bangalore      | RAVI       | KUMAR     | ravi@gmail.com   |   1 |
|     1002 | 2026-02-02 | C002        | SNEHA REDDY   | Grocery          | Basmati Rice 5kg  |        1 |     650.00 | Credit Card  | Hyderabad      | SNEHA      | REDDY     | sneha@gmail.com  |   1 |
|     1003 | 2026-02-03 | C003        | ARJUN MEHTA   | Fashion          | Men's T-Shirt     |        3 |     499.00 | Cash         | Chennai        | ARJUN      | MEHTA     | arjun@gmail.com  |   1 |
|     1004 | 2026-02-04 | C004        | PRIYA SHARMA  | Electronics      | Bluetooth Speaker |        1 |    1499.00 | Debit Card   | Mumbai         | PRIYA      | SHARMA    | priya@gmail.com  |   1 |
|     1005 | 2026-02-05 | C005        | KIRAN RAO     | Home & Kitchen   | Mixer Grinder     |        1 |    2499.00 | UPI          | Bangalore      | KIRAN      | RAO       | kiran@gmail.com  |   1 |
|     1006 | 2026-02-06 | C006        | NEHA VERMA    | Beauty           | Face Cream        |        4 |     299.00 | Credit Card  | Delhi          | NEHA       | VERMA     | neha@gmail.com   |   1 |
|     1007 | 2026-02-07 | C007        | RAHUL DAS     | Grocery          | Cooking Oil 1L    |        5 |     180.00 | Cash         | Kolkata        | RAHUL      | DAS       | rahul@gmail.com  |   1 |
|     1008 | 2026-02-08 | C008        | ANJALI NAIR   | Fashion          | Women's Jeans     |        2 |    1199.00 | UPI          | Kochi          | ANJALI     | NAIR      | anjali@gmail.com |   1 |
|     1009 | 2026-02-09 | C009        | SURESH PATEL  | Electronics      | Smartphone        |        1 |   15999.00 | Debit Card   | Ahmedabad      | SURESH     | PATEL     | suresh@gmail.com |   1 |
|     1010 | 2026-02-10 | C010        | MEENA IYER    | Home & Kitchen   | Pressure Cooker   |        1 |    1899.00 | Credit Card  | Pune           | MEENA      | IYER      | meena@gmail.com  |   1 |
+----------+------------+-------------+---------------+------------------+-------------------+----------+------------+--------------+----------------+------------+-----------+------------------+-----+
10 rows in set (0.00 sec)

mysql> SELECT Product_Name, Unit_Price, MAX(Unit_Price) OVER(PARTITION BY Product_Category) AS Max_In_Cat FROM Orders;
+-------------------+------------+------------+
| Product_Name      | Unit_Price | Max_In_Cat |
+-------------------+------------+------------+
| Face Cream        |     299.00 |     299.00 |
| Wireless Mouse    |     799.00 |   15999.00 |
| Bluetooth Speaker |    1499.00 |   15999.00 |
| Smartphone        |   15999.00 |   15999.00 |
| Men's T-Shirt     |     499.00 |    1199.00 |
| Women's Jeans     |    1199.00 |    1199.00 |
| Basmati Rice 5kg  |     650.00 |     650.00 |
| Cooking Oil 1L    |     180.00 |     650.00 |
| Mixer Grinder     |    2499.00 |    2499.00 |
| Pressure Cooker   |    1899.00 |    2499.00 |
+-------------------+------------+------------+
10 rows in set (0.03 sec)

mysql> SELECT Product_Category, Product_Name, Unit_Price, MAX(Unit_Price) OVER(PARTITION BY Product_Category) AS Max_In_Cat FROM Orders;
+------------------+-------------------+------------+------------+
| Product_Category | Product_Name      | Unit_Price | Max_In_Cat |
+------------------+-------------------+------------+------------+
| Beauty           | Face Cream        |     299.00 |     299.00 |
| Electronics      | Wireless Mouse    |     799.00 |   15999.00 |
| Electronics      | Bluetooth Speaker |    1499.00 |   15999.00 |
| Electronics      | Smartphone        |   15999.00 |   15999.00 |
| Fashion          | Men's T-Shirt     |     499.00 |    1199.00 |
| Fashion          | Women's Jeans     |    1199.00 |    1199.00 |
| Grocery          | Basmati Rice 5kg  |     650.00 |     650.00 |
| Grocery          | Cooking Oil 1L    |     180.00 |     650.00 |
| Home & Kitchen   | Mixer Grinder     |    2499.00 |    2499.00 |
| Home & Kitchen   | Pressure Cooker   |    1899.00 |    2499.00 |
+------------------+-------------------+------------+------------+
10 rows in set (0.09 sec)

mysql> SELECT * FROM (SELECT *, ROW_NUMBER() OVER(PARTITION BY Order_ID ORDER BY Order_ID) AS row_num FROM Orders) t WHERE row_num > 1;
Empty set (0.00 sec)

mysql> SELECT Order_Date, Customer_ID, COUNT(DISTINCT Customer_ID) OVER(ORDER BY Order_Date) AS Running_Unique_Customers FROM Orders;
ERROR 1235 (42000): This version of MySQL doesn't yet support '<window function>(DISTINCT ..)'
mysql> notee;
