SELECT *
FROM actor;

SELECT first_name, last_name
FROM actor;

-- add specificity with the WHERE clause
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- Like Clause
SELECT *
FROM actor
WHERE last_name LIKE 'Wahlberg'

-- wildcard
--match all W-las names
SELECT *
FROM actor
WHERE last_name LIKE 'W%'

-- single letter wildcard: _; this returns results with the same amount of characters as the amount of underscores you have
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'C___'

SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'C__%'

-- comparing operators
-- >, <, >=, <=, !=, <>(another way of saying not equal)

SELECT *
FROM payment;

-- Find all payments more than $5
SELECT customer_id, amount
FROM payment
WHERE amount > 5;

-- ordering queries using ASC, DESC
SELECT customer_id, amount
FROM payment
WHERE amount > 5
ORDER BY amount DESC;

-- conjunctions AND and OR operators 
SELECT customer_id, amount
FROM payment
WHERE amount > 5 AND amount < 100
ORDER BY amount DESC;

--aggregator
-- SUM, AVG, COUNT, MIN, MAX

SELECT SUM(amount) AS smallest_amount_greater_than_zero
FROM payment
WHERE amount > 0;

-- DISTINCT; basically takes the individual amounts. Example below will count the unique values instead of adding up similar values
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 0;

-- Group By; gives us the ability to query how much a customer ID may have spent. Useful for repeated transactions
SELECT customer_id, SUM(amount)
FROM payment
WHERE amount > 0
GROUP BY customer_id;

-- HAVING clause; basically a where clause for aggregate functions

-- Query to display customer_ids that show up more than 5 times
-- Grouping by the customer's email
SELECT COUNT(customer_id),email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) > 0;

-- extra stuff
-- LIMIT clause
-- Query to display customer_ids that show up more than 5 times
-- Grouping by the customer's email
SELECT COUNT(customer_id),email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) > 0
LIMIT 5;

-- OFFSET clause
