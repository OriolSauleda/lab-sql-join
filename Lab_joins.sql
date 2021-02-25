-- List number of films per category.

SELECT name,count(f.film_id) as number_of_films
FROM sakila.film as f
JOIN sakila.film_category as fc on f.film_id = fc.film_id
JOIN sakila.category as c on fc.category_id = c.category_id
GROUP BY name
ORDER BY count(f.film_id) desc;

-- Display the first and last names, as well as the address, of each staff member.

SELECT first_name,last_name, address
FROM sakila.staff as st
JOIN sakila.address as ad on st.address_id = ad.address_id;

-- Display the total amount rung up by each staff member in August of 2005.

SELECT first_name,last_name,sum(amount)
FROM sakila.staff as st
JOIN sakila.payment as p on st.staff_id = p.staff_id
WHERE date_format(convert(payment_date,date),'%Y') = 2005 AND date_format(convert(payment_date,date),'%M') = 'August'
GROUP BY first_name,last_name;

-- List each film and the number of actors who are listed for that film.

SELECT title, count(actor_id) as number_of_actors
FROM sakila.film as f
JOIN sakila.film_actor as fa on f.film_id = fa.film_id
GROUP BY title;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT first_name,last_name,sum(amount) as 'total_paid by_customer'
FROM sakila.payment as p 
JOIN sakila.customer as c on p.customer_id = c.customer_id
GROUP BY first_name,last_name
ORDER BY last_name;