create database Project;
use Project;
drop table Customer_purchase;
select * from Customer_Purchase;
select * from Customers;
select * from customer_purchase 
where Productname is null
order by ProductID;
select * from Products;
select * from Orders
where purchasequantity is null;
drop table Products;
drop table Customers;
create table Customers as with cte as (select CustomerName,PurchaseDate,country from Customer_Purchase)
select *,row_number() over(order by CustomerName) as customerid from cte;
select * from Customers
where country is null;
create table Products as with cte as (select distinct ProductName,ProductCategory from Customer_Purchase)
select *,row_number() over(order by ProductName)+300 as Productid from cte;
select * from Products
where Productcategory is null;
select * from Orders;
alter table Customers 
add constraint pk primary key(Customerid); 
alter table Customers
modify Country varchar(100),
modify Purchasedate date;
desc Customers;
alter table Products 
add constraint pk primary key(Productid); 
desc Products;
alter table Orders 
add constraint pk primary key(Transactionid); 
desc Orders;
create table Orderdetail(
TransactionID int, foreign key(transactionID) references Orders(TransactionID) ,
Productid bigint unsigned, foreign key(productid) references Products(productid),
Customerid bigint unsigned, foreign key(customerid) references Customers(customerid),
constraint pk primary key(Transactionid)

);
alter table Customer_purchase
drop column purchasedate;
desc customer_purchase;
desc Customers;
alter table customers
modify Customerid int;

select * from Customers
order by Customername;
drop table customer_purchase;
SET SQL_SAFE_UPDATES = 0;
update customer_purchase_data
join Customers on Customer_purchase_data.Customername=Customers.customername
set Customer_purchase_data.Customerid=Customers.Customerid;
select * from Customer_purchase_data
order by Customername;
update customer_purchase_data
join Products on Customer_purchase_data.Productname=Products.Productname
set Customer_purchase_data.Productid=Products.Productid;
desc Customer_purchase_data;
alter table Customer_purchase_data
modify purchasedate date;
alter table customer_purchase_data
add constraint pk primary key(transactionid);
alter table customer_purchase_data
modify column Customerid int not null;
alter table customer_purchase_data
modify column Productid int not null;
select * from Customer_purchase_data;
















