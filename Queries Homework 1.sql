-- Queries Homework 1
-- James Sior
-- September 16, 2013

1. SELECT *
   FROM customers;
 
2. SELECT Agents.name, Agents.city
   FROM Agents
   WHERE name = 'Smith';

3. SELECT Products.pid, Products.name, Products.quantity
   FROM products
   WHERE priceUSD >= 1.25;
   
4. SELECT Orders.ordno, Orders.aid
   FROM orders;

5. SELECT Customers.name, Customers.city
   FROM customers
   WHERE city != 'Dallas';

6. SELECT Agents.name
   FROM Agents
   WHERE city = 'New York' OR city = 'Newark';

7. SELECT *
   FROM products
   WHERE city != 'Newark' AND city != 'New York' AND priceUSD <= 1.00;

8. SELECT *
   FROM orders
   WHERE mon = 'jan' OR mon = 'feb';

9. SELECT *
   FROM orders
   WHERE mon = 'feb' AND dollars < 100;

10. SELECT *
    FROM orders
    WHERE cid = 'c005' ;