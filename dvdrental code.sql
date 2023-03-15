-- Select Statement is always with from
SELECT * FROM actor;
SELECT * FROM address;
SELECT * FROM film;

--return title, description and rating
SELECT title, description, release_year, rating 
FROM film;

--return first and last name from actors
SELECT first_name, last_name
FROM actor;

--return address, district, postal_code 
SELECT address, district, postal_code
FROM address;

--DISTINCT RATING
SELECT DISTINCT rating
FROM film;

--DISTINCT REPLACEMENT COST
SELECT DISTINCT replacement_cost
FROM film;

--return distinct amount
SELECT DISTINCT amount
FROM payment;


--Select where statement(It is used filter your query based on a condition)
Select * from actor;
Select actor_id, first_name, last_name
from actor
where actor_id in (1,10, 25, 108, 200, 105);


Select * from film;

Select title, release_year, length, rental_rate
from film
where rating ='R';

Select title, release_year, length, rental_rate
from film
where length <= 50;

--select count

Select count(*) from film;
Select count(*) from customer;

Select count(*) 
from film
where rating = 'R';

--limit
select * from rental limit 5;
select * from city limit 3;
select * from customer limit 5;

-- order by statment (Arrange result by ascending or descending order)
Select * from customer;
Select first_name, last_name, email
from customer
--order by first_name asc;
--by default it gives by acsending 
order by first_name desc;


Select * from payment;
--top 10 customer that spent the most money

select customer_id, amount
from payment
where amount >= 10
order by amount desc
limit 10;

-- get the title of the movies with files id 1-5
select film_id, title
from film
order by film_id 
limit 5;

--Between statement(lower value to higher value)

select customer_id, staff_id, amount 
from payment
where amount between 3 and 5
order by amount desc;

--in statement (check for values in a list)
select first_name, last_name, email
from customer
where first_name in ('Mary', 'Maria', 'Susan', 'micheal');

--like statment(search for lookalike)and ilike (same function but not case sentitve)
select first_name, last_name, email 
from customer
--where first_name like 'Ja%';
where first_name ilike 'ja%';

--Aggregate Function (Count, Min, Max, Average, Sum)
Select count(*) from payment;
Select min(amount) from payment;
Select max(amount) from payment;
Select round(avg(amount), 2) from payment;
Select sum(amount) from payment;

--Group by statement(Groups your result and also works with aggregate functions)
Select * from film;

select rating, count(rating)
from film
group by rating
order by count(rating) desc;

select *
from payment
where customer_id = 341;

select customer_id, sum(amount)
from payment
where customer_id = 341
group by customer_id;

select customer_id, sum(amount)
from payment
group by customer_id
order by sum(amount) desc
limit 10;

--having clause (is used in conjunction with the group by)
select customer_id, sum(amount)
from payment
group by customer_id
having sum(amount) >= 180
order by sum(amount) desc;

Select store_id, count(customer_id)
from customer
group by store_id
having count(customer_id) > 300;

--As statement (change header)
select first_name as name, last_name as Surname, email as mailing_details
from customer;

