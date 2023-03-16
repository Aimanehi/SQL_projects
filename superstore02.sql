--show all details about properties, orders and products
select * from orders;
select * from products;
select * from propertyinfo;

--Select the city and state column in propertyinfo table.
select "PropertyCity", "PropertyState"
from propertyinfo;

--Show the dates orders were made and the quantity of orders made.
select "OrderDate", "Quantity"
from orders;

-- show unique dates orders were made
select distinct "OrderDate"
from orders
order by "OrderDate" Desc
limit 5;

-- Show the different products category we have in super store
select distinct "ProductCategory"
from products;

--Show the different properties that have made orders.
select "PropertyID" 
from orders;

--Show the data from order table and sort in ascending order of quantity
select "OrderID", "Quantity"
from orders
order by "Quantity";

-- Show all products and their details and sort in descending order of price
select * from products
order by "Price" desc;

--Find the five most expensive products
select * from products
order by "Price" desc
limit 5;

--Find the five least expensive products
select * from products
order by "Price" asc
limit 5;

--Select all properties in descending order of the city they are in
select * from propertyinfo
order by "PropertyCity" desc;

--Find the name of products whose id is 50
select "ProductName", "ProductID" from products
where "ProductID" = 50;

--Find the name and category of product whose id is 94
select "ProductName", "ProductCategory", "ProductID"
from products
where "ProductID" = 94;

--Find the name and category of product whose prices are above $200
select "ProductName", "ProductCategory", "ProductID", "Price"
from products
where "Price" >= 200
order by "Price" desc;

--Find the name and category of the most expensive product
select "ProductName", "ProductCategory", "Price" from products
order by "Price" desc
limit 1;

--Find the name of product whose prices are between $50 and $200
select "ProductName", "ProductCategory", "ProductID", "Price"
from products
where "Price" between 50 and 200
order by "Price" desc;

--Find the productid of products sold between 07-01-2015 and 10-01-2015
select "ProductID", "OrderDate"
from orders
where "OrderDate" between '2015-01-07' and '2015-01-10';

--Find orders by property 14, 16, and 10
select *
from propertyinfo
where "PropID" in (14,16,10);

--Find orders by property not 14, 16, and 10
select *
from propertyinfo
where not "PropID" in (14,16,10);

--How much will all products be worth if there were just 2 of it in the store?
select sum(2*"Price") 
from products;

-- What product price is the lowest?
select min("Price") as "LowestPrice"
from products;
-- to add the product name to the above question
select "Price", "ProductName"
from products
where "Price" = (select min("Price") from products);

--What product price is the highest?
select "Price", "ProductName"
from products
where "Price" = (select max("Price") from products);

--How many products are there?
select count("ProductID") as "TotalProducts"
from products;

-- How many orders were made in total?
select count("OrderID") as "TotalOrder"
from orders;

--What is the average price of products?
select round(avg("Price"), 1) as "AveragePrice"
from products;

-- What products have names starting with “T”?
select *
from products
where "ProductName" ilike 't%';

-- We want to find the the average price of housekeeping products.
select round(avg("Price"), 1) as "AveragePrice", "ProductCategory"
from products
group by "ProductCategory"
having "ProductCategory" = 'Housekeeping';

--We will like to know the number of products available and the sum of their prices for each product category
--assuming there is just one of each product available in the store.
select sum("Price") as "TotalPrice", "ProductName", "ProductCategory"
from products
group by "ProductCategory","ProductName";

select sum("Price") as "TotalPrice", "ProductCategory"
from products
group by "ProductCategory";

--show the ordered properties
select distinct "PropertyID", "PropertyState", "PropertyCity","OrderDate", "Quantity"
from orders
join propertyinfo
on orders."PropertyID" = propertyinfo."PropID"
order by "Quantity" desc;