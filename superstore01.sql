-- Joining order and product tables using INNER JOIN
select *
from orders
inner join products
on orders."ProductID" = products."ProductID";

-- Left JOin 
select orders."OrderID", orders."OrderDate", products."ProductName", products."Price"
from orders
left join products
on orders."ProductID" = products."ProductID";

-- Left JOin 
select orders."OrderID", orders."OrderDate", products."ProductName", products."Price"
from orders
right join products
on orders."ProductID" = products."ProductID";

-- Left JOin 
select orders."OrderID", orders."OrderDate", products."ProductName", products."ProductCategory", products."Price"
from orders
full outer join products
on orders."ProductID" = products."ProductID";

--Union operator is used to combine the result-set of two or more SELECT statements.
select "ProductID"
from orders
union 
select "ProductID"
from products;

--CASE expression goes through conditions and returns a value when the first condition is met (like an if-then-else statement)
select "Quantity", "Price", "ProductName",
case
	when "Quantity" = 2 then "Price" - ("Price" * .5)
	when "Quantity" = 3 then "Price" - ("Price" * .10)
	else "Price"
end as "Discount"
from orders
join products
on orders."ProductID" = products."ProductID"
order by "Quantity" Desc;

--Having is used for aggregrate in place of where
select count("Quantity") as "TotalQuantity", count("Price") as "TotalPrice", "ProductCategory"
from orders
join products
on orders."ProductID" = products."ProductID"
group by "ProductCategory"
Having count("Price") > 1000
order by count("Quantity") Desc;


--partition by

select "Quantity", "Price", "ProductCategory",
count("ProductCategory") over (partition by "ProductCategory")
from orders
join products
on orders."ProductID" = products."ProductID";
