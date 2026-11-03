drop database if exists shopping_management;
create database shopping_management;
use shopping_management;

create table customers(
Customer_id int primary key auto_increment,
Customer_name varchar(100) not null,
email varchar (100) not null,
Phone_number char (10),
Age tinyint unsigned check (age>0),
Gender ENUM( 'Male', 'female','other'),
Country varchar (50) Default 'India',
City varchar(50),
Pincode varchar(6) DEFAULT '201301',
Registeration_date_inserted_at DATE DEFAULT (CURRENT_DATE),
create_time TIME DEFAULT (CURRENT_TIME),
create_at TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),

Address varchar(250)
);
CREATE TABLE Customers_order (
order_Id INT primary key AUTO_INCREMENT,
customer_id INT,
Order_date  DATE default (CURRENT_DATE),
Order_amount DECIMAL(10,2) not null,
Order_status Enum('Pending','Processing','Shipped','Delivered','Canelled') default 'Pending',
Payment_method Enum('Cash','Card','UPI','Net Banking'),
Shipping_address varchar(250), 
Delivery_pincode char(6),
Quantity int check(Quantity>=0),
Discount_amount decimal(10,2) default 0,
Delivery_date Date,
Created_at TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
Tracking_number varchar(30) Not Null,
Delivery_status Enum('Not Dispatched','InTransit','Delivered','Returned') default 'Not Dispatched',
Order_notes varchar(1000),
foreign key (customer_id) references customers(Customer_id) on delete cascade on update cascade);

select * from customers;
select * from Customers_order;