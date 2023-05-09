use sakila ;

select  * from actor a;

select * from country c ;
/*Which actors have the first name ‘Scarlett’*/

select * from actor where first_name ="Scarlett";

/* Which actors have the last name ‘Johansson’*/

select  * from actor where last_name ="Johansson";

/*How many distinct actors last names are there?*/

SELECT COUNT(DISTINCT last_name) FROM actor ;

SELECT DISTINCT last_name FROM actor ;

/*Which last names are not repeated?*/

select last_name  from actor group  by last_name HAVING COUNT(last_name) <=1;


select Count(last_name)<=1 ,last_name  from actor group  by last_name ;

/*Which last names appear more than once?*/

select last_name  from actor group  by last_name HAVING COUNT(last_name) >1;


/*Which actor has appeared in the most films?*/

/*select  Max(mostfilmedbyactor) from (select count(film_id) as mostfilmedbyactor,actor_id from film_actor group by actor_id)  as a;*/

 select  * from actor where  actor_id = (select actor_id from ( select count(film_id) as mostfilmedbyactor,actor_id from film_actor group by actor_id ORDER by mostfilmedbyactor desc  LIMIT 1)as mostfilmedactorid) ;  

/*Is ‘Academy Dinosaur’ available for rent from Store 1?*/

 
select inventory_id  from inventory where film_id = (select film_id from film where title ='Academy Dinosaur') and store_id=1

select * from rental  where inventory_id  in( select inventory_id  from inventory where film_id = (select film_id from film where title ='Academy Dinosaur') and store_id =1) and return_date <CURRENT_TIMESTAMP;

/*Insert a record to represent Mary Smith renting ‘Academy Dinosaur’ from Mike Hillyer at Store 1 today */

select * from customer  where first_name ="MARY";

INSERT INTO inventory  (film_id, store_id )
VALUES ((select film_id  from film where title ='Academy Dinosaur') , (select store_id from staff where first_name="Mike" and last_name="Hillyer"))


select inventory_id  from inventory order by inventory_id desc limit 1

INSERT INTO rental  (rental_date ,inventory_id , customer_id ,return_date ,staff_id)
VALUES (CURRENT_TIMESTAMP,
(select inventory_id  from inventory order by inventory_id desc limit 1),(select customer_id  from customer where first_name ="MARY" and  last_name="Smith"),
 (DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 1 day)), (select staff_id  from staff where first_name="Mike" and last_name="Hillyer"));

select *  from rental r  order by r.return_date  desc

/*When is ‘Academy Dinosaur’ due?*/

select 	return_date  from rental r 
inner join inventory i 
on r.inventory_id =i.inventory_id 
inner join film f 
on i.film_id =f.film_id where title='Academy Dinosaur' order by return_date ;





/* What is that average running time of all the films in the sakila DB?*/

/*select Avg(minu)  from  (select r.rental_id , r.staff_id  ,
(TIMESTAMPDIFF (minute ,  r.rental_date ,  r.return_date)) as minu
FROM rental r  ) as a ;*/

select Avg (length) from film

select count(select count(film_id),inventory_id  from inventory group by inventory_id  )  from 

select count(inventory_id) as inventoryid,film_id  from inventory group by film_id order by inventoryid desc  ;

/*What is the average running time of films by category?*/
select c.name,avg(f.length)  from film f
inner join film_category fc 
on f.film_id =fc.film_id 
inner join category c 
on fc.category_id =c.category_id
group by c.name ;




/*Why does this query return the empty set?*/




