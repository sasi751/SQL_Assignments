mysql> SELECT SIN(RADIANS(30)) AS Sine_Value;
+---------------------+
| Sine_Value          |
+---------------------+
| 0.49999999999999994 |
+---------------------+
1 row in set (0.17 sec)

mysql> SELECT COS(RADIANS(30)) AS Cosine_Value;
+--------------------+
| Cosine_Value       |
+--------------------+
| 0.8660254037844387 |
+--------------------+
1 row in set (0.12 sec)

mysql> SELECT CEIL(COS(RADIANS(30))) AS Cosine_Value;
+--------------+
| Cosine_Value |
+--------------+
|            1 |
+--------------+
1 row in set (0.33 sec)

mysql> SELECT SIN(45);
+--------------------+
| SIN(45)            |
+--------------------+
| 0.8509035245341184 |
+--------------------+
1 row in set (0.00 sec)

mysql> SELECT SIN(30);
+---------------------+
| SIN(30)             |
+---------------------+
| -0.9880316240928618 |
+---------------------+
1 row in set (0.00 sec)

mysql> SELECT TAN(RADIANS(45)) AS Tangent_Value;
+--------------------+
| Tangent_Value      |
+--------------------+
| 0.9999999999999999 |
+--------------------+
1 row in set (0.04 sec)

mysql> SELECT RADIANS(180);
+-------------------+
| RADIANS(180)      |
+-------------------+
| 3.141592653589793 |
+-------------------+
1 row in set (0.00 sec)

mysql> SELECT DEGREES(PI());
+---------------+
| DEGREES(PI()) |
+---------------+
|           180 |
+---------------+
1 row in set (0.04 sec)

mysql> SELECT LOG10(100);
+------------+
| LOG10(100) |
+------------+
|          2 |
+------------+
1 row in set (0.03 sec)

mysql> SELECT LOG(2.718);
+-------------------+
| LOG(2.718)        |
+-------------------+
| 0.999896315728952 |
+-------------------+
1 row in set (0.05 sec)

mysql> SELECT POW(5, 2);
+-----------+
| POW(5, 2) |
+-----------+
|        25 |
+-----------+
1 row in set (0.01 sec)

mysql> SELECT POW(5, 3);
+-----------+
| POW(5, 3) |
+-----------+
|       125 |
+-----------+
1 row in set (0.00 sec)

mysql> SELECT GREATEST(10, 20, 30), LEAST(10, 20, 30);
+----------------------+-------------------+
| GREATEST(10, 20, 30) | LEAST(10, 20, 30) |
+----------------------+-------------------+
|                   30 |                10 |
+----------------------+-------------------+
1 row in set (0.02 sec)

mysql> SELECT SUM(Quantity * Quantity) FROM Orders;
+--------------------------+
| SUM(Quantity * Quantity) |
+--------------------------+
|                       63 |
+--------------------------+
1 row in set (0.07 sec)

mysql> select VAR_POP(Unit_Price) from Orders;
+---------------------+
| VAR_POP(Unit_Price) |
+---------------------+
|         20579825.96 |
+---------------------+
1 row in set (0.00 sec)

mysql> STDDEV_POP(Unit_Price);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'STDDEV_POP(Unit_Price)' at line 1
mysql> select STDDEV_POP(Unit_Price) from Orders;
+------------------------+
| STDDEV_POP(Unit_Price) |
+------------------------+
|      4536.499306734214 |
+------------------------+
1 row in set (0.05 sec)

mysql> SELECT EXP(AVG(LOG(Unit_Price))) FROM Orders;
+---------------------------+
| EXP(AVG(LOG(Unit_Price))) |
+---------------------------+
|        1066.4756034111588 |
+---------------------------+
1 row in set (0.07 sec)

mysql> SELECT COUNT(*) / SUM(1 / Unit_Price) FROM Orders;
+--------------------------------+
| COUNT(*) / SUM(1 / Unit_Price) |
+--------------------------------+
|                       617.8765 |
+--------------------------------+
1 row in set (0.04 sec)

mysql> SELECT (AVG(Quantity * Unit_Price) - AVG(Quantity) * AVG(Unit_Price)) / (STDDEV_POP(Quantity) * STDDEV_POP(Unit_Price)) AS CorrelationFROM Orders;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Orders' at line 1
mysql> SELECT (AVG(Quantity * Unit_Price) - AVG(Quantity) * AVG(Unit_Price)) / (STDDEV_POP(Quantity) * STDDEV_POP(Unit_Price)) AS Correlation FROM Orders;
+----------------------+
| Correlation          |
+----------------------+
| -0.37618239823563115 |
+----------------------+
1 row in set (0.00 sec)

mysql> SELECT (COUNT(*) * SUM(Quantity * Unit_Price) - SUM(Quantity) * SUM(Unit_Price)) / 
    ->        (COUNT(*) * SUM(Quantity * Quantity) - SUM(Quantity) * SUM(Quantity)) AS Slope
    -> FROM Orders;
+--------------+
| Slope        |
+--------------+
| -1241.333333 |
+--------------+
1 row in set (0.02 sec)

mysql> notee;
