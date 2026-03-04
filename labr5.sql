create database join_lab_db;
use join_lab_db;

create table customers (
customer_id int primary key auto_increment,
name varchar(50),
city varchar(50)
);

create table orders (
order_id int primary key auto_increment,
customer_id int,
order_date date,
foreign key (customer_id) references customers(customer_id)
);

create table products(
product_id int primary key auto_increment,
product_name varchar(50),
price decimal(10,2)
);

create table order_items(
item_id int primary key auto_increment,
order_id int,
product_id int,
quantity int,
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);

create table employees (
employee_id int primary key auto_increment,
name varchar(50),
manager_id int,
foreign key (manager_id) references employees(employee_id)
);

insert into customers (name, city) values
('Bat', 'Ulaanbaatar'),
('Sara', 'Darkhan'),
('Bold', 'Ulaanbaatar');

insert into orders (customer_id, order_date) values
('1', '2026-01-01'),
('1', '2026-01-05'),
('2', '2026-02-01');

insert into products (product_name, price) values
('Keyboard', '120000'),
('Mouse', '80000'),
('Monitor', '600000');

INSERT INTO order_items (order_id, product_id, quantity) 
VALUES 
(1, 1, 1), 
(1, 2, 2), 
(2, 3, 1), 
(3, 1, 1);

insert into employees (name, manager_id) values
('Manager A', null),
('Employee B', 1),
('Employee C', 1);

-- inner join-------------
select c.name, o.order_id
from customers c
inner join orders o on c.customer_id = o.customer_id;

-- left join--------------
select c.name, o.order_id
from customers c
left join orders o on c.customer_id = o.customer_id;

-- right join-------------
 select c.name, o.order_id
from customers c
right join orders o on c.customer_id = o.customer_id;

-- full join--------------
select c.name, o.order_id
from customers c
left join orders o on c.customer_id = o.customer_id
union
select c.name, o.order_id
from customers c
right join orders o on c.customer_id = o.customer_id; 

-- self join--------------
select e.name as employee, m.name as manager
from employees e
left join employees m on e.manager_id= m.employee_id;

-- join + where ----------
select c.name, o.order_id
from customers c
left join orders o on c.customer_id = o.customer_id 
where c.city ='Ulaanbaatar';

-- Олон хүснэгт join-------
 select c.name, p.product_name, oi.quantity
from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id;

select *from order_items;