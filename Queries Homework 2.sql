-- Queries Homework 2
-- James Sior
-- September 23, 2013

--Get the cities of agents booking an order for customer c002

SELECT distinct city
FROM agents
WHERE aid in (
		 SELECT aid
		 FROM orders
		 WHERE cid = 'c002' )

--Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. 

SELECT distinct pid
FROM orders
WHERE aid in (
		SELECT aid
		FROM orders
		WHERE cid in (
					SELECT cid
					FROM customers
					WHERE city = 'Kyoto')
	          );

--Find the cids and names of customers who never placed an order through agent a03

SELECT cid, name
FROM customers
WHERE cid not in (
		  SELECT distinct cid
		  FROM orders
		  WHERE aid = 'a03');

--Get the cids and names of customers who ordered both product p01 and p07

SELECT cid, name
FROM customers
WHERE cid in (
		SELECT distinct cid
		FROM orders
		WHERE pid = 'p01' OR pid = 'p07');

--Get the pids of products ordered by any customers who ever placed an order through agent a03.

SELECT distinct pid
FROM orders
WHERE cid in (
	       SELECT distinct cid
	       FROM orders
           WHERE aid = 'a03');

--Get the names and discounts of all customers who place orders through agents in Dallas or Duluth.

SELECT name, discount
FROM customers
WHERE cid IN (
	       SELECT distinct cid
           FROM orders
           WHERE aid in (
						SELECT aid
						FROM agents
						WHERE city = 'Dallas' OR city = 'Duluth')
             );

--Find all customers who have the same discount as that of any customers in Dallas or Kyoto.

SELECT *
FROM customers
WHERE city != 'Kyoto' AND city != 'Dallas' AND discount in (
																SELECT discount
																FROM customers
																WHERE city = 'Kyoto' OR city = 'Dallas')