use sakila ;


select * from category 

select * from city


update film_category 
set film_category_id = (@rownum := 1 + @rownum) + 0
WHERE 0 = (@rownum:=0)
order by film_category_id

 select * from  film f
 left join film_actor fa 
 on f.film_id = fa.film_id
 right join category c 
 on c.category_id  =c.category_id 
 where c.category_id  =5;
 

select * from film_actor fa 

select * from customer c 

select * from country c ;


select * from film faa
where faa.film_id =(
select ab.filmId
from (
select  count(fa.actor_id) as actor_count, f.title  as title,f.film_id as filmId from actor a 
inner join film_actor fa 
on a.actor_id =fa.actor_id 
inner join film f 
on fa.film_id = f.film_id 
group by f.film_id 
order by actor_count desc
limit 1) ab);




