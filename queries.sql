-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select
    p.productname as 'Product Name',
    c.categoryname as 'Category'
from Product as p
join Category as c
    on p.categoryid = c.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select
    o.id as 'order id',
    s.companyname as 'Company',
    o.OrderDate as 'order date'
from "Order" as o
join "Shipper" as s
    on o.shipvia = s.id
where o.OrderDate < '2012-08-09'
order by OrderDate;


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.



Select 
    p.ProductName as 'product name', 
    od.Quantity as 'quantity'
from Product as p
join OrderDetail as od
    on od.ProductId = p.Id
where od.OrderId = '10251';

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

Select 
    o.Id as 'order Id',
    c.CompanyName as 'Company Name', 
    e.LastName as 'Employee Last Name'
from "Order" as o
join Customer as c
    on o.CustomerId = c.Id
join Employee as e
     on o.EmployeeId = e.Id;
