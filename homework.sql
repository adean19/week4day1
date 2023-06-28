-- Week 5 - Monday Questions 

-- 1. How many actors are there with the last name ‘Wahlberg’? 
Answer: 2

SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99? 
Answer: 1

SELECT payment_id, amount
FROM payment
WHERE amount BETWEEN 3.99 and 5.99

-- 3. What film does the store have the most of? (search in inventory) 

Answer: 'There are many that are returned using the code below. But the most these items have are around 8 copies.'

SELECT film_id, count(film_id)
FROM inventory
GROUP BY film_id
ORDER BY count(*) DESC;


-- 4. How many customers have the last name ‘William’? 

Answer: 'No data'

SELECT first_name, last_name
FROM customer
WHERE last_name = 'William'


-- 5. What store employee (get the id) sold the most rentals? 

Answer: 'Staff ID 1 sold 36 more rentals than the other(s)'

SELECT staff_id, count(staff_id)
FROM rental
GROUP BY staff_id

-- 6. How many different district names are there? 

Answer: 378

SELECT count(DISTINCT district)
FROM address


-- 7. What film has the most actors in it? (use film_actor table and get film_id) 

Answer: 'Lambs Cincinatti'

SELECT film_id, count(actor_id),
FROM film_actor
GROUP BY film_id
ORDER BY count(actor_id) DESC;

SELECT film_id, title
FROM film
WHERE film_id = 508


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) 

Answer: 13

SELECT count(last_name)
FROM customer
WHERE store_id = 1 and last_name LIKE '%es';


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers  with ids between 380 and 430? (use group by and having > 250) 

Answer: '3 payment amounts had over 250 rentals for customers between 380 and 430'

SELECT count(amount), amount
FROM payment
WHERE customer_id between 380 and 430
GROUP BY amount
HAVING count(rental_id) > 250;

-- 10. Within the film table, how many rating categories are there? And what rating has the most  movies total?

Answer: 'There are 5 different rating categories. Out of the 5 categories, PG-13 has the most movies with 223 entries.'

SELECT count(DISTINCT(rating))
FROM film

SELECT count(film_id), rating
FROM film
GROUP BY rating
ORDER BY count(film_id) DESC;