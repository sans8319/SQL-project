--1give the list of products name , catagory name  and its list price

--inner join
select*from production.products
 --the query return only a list of catagpry identifications numbers, not the catefory names.
 --to include the catagory name in the result set, u use the inner join clause as follows
select* from  production.products p
inner join production.catagories c
on c.category_id = p.category_id
order by
products_name desc

--with required field selections

select products_name, category_name, list_price
from  production.products p
inner join production.catagories c
on c.category_id = p.category_id
order by
products_name desc
--if we want brand name also 
select products_name, category_name,brand_name, list_price
from  production.products p
inner join production.catagories c
on c.category_id = p.category_id
inner join production.brands b
on b.brand_id = p.brand_id
order by
  products_name desc

--2 give the list of products the have been sold  to anny customer yet
--left join because hme sare prodects chahiy + jina order ho chuka hai
--step 1, get the order deatils coo=rresdonding to product name
select products_name,
order_id from
production.products p
left join sales.order_items o
on o.products_id = p.products_id
order by order_id

-- jo order nahi huye 
select products_name,
order_id from
production.products p
left join sales.order_items o
on p.products_id = o.products_id
where order_id is null
order by order_id



-- 3 give the product name along with its order details like ordr id , its item id  and the order date

select p.products_name, i.order_id,i.item_id, o.order_date
from  production.products p
left join sales.order_items i
on p.products_id = i.products_id
left join sales.orders o
on o.order_id = i.order_id

--find the producs that blong to order id  100 in above query

select p.products_name
from  production.products p
left join sales.order_items i
on p.products_id = i.products_id
left join sales.orders o
on o.order_id = i.order_id
where o.order_id = 100

--cross join
--the following statements return the combination of all products ansd stores.
--the resultset can be used for stocktaking procedure during the montn-end and year-end close

select products_id,
products_name,
store_id,
0 as quantity--initial value is set to 0
from production.products
cross join sales.stores 
order by 
products_name,
store_id














--4 filter out the products that do not have sale using right join



--5 who report to whom?
select
e.first_name + ' ' +e.last_name as employee,
m.first_name + ' ' +m.last_name as manager
from
sales.staffs e
left join
sales.staffs m
on
m.manager_id = e.staff_id
order by manager



--6 customer located in same city
select c1.city, 
c1.first_name + ' ' +c1.last_name as customer1,
c2.first_name + ' ' +c2.last_name as customer2
from
sales.customers c1
inner join
sales.customers c2
on c1.customer_id != c2.customer_id
and c1.city = c2.city
order by 
city,
customer2,
customer1
