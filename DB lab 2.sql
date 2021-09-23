-- 1.Explain the difference between DDL and DML,
-- give the following examples:
-- a.at least 3 DDL commands;
-- b.at least 4 DML commands.

-- •	Data Definition Language (DDL) helps you to define the database structure
-- or schema while Data Manipulation language (DML command) allows you to manage
-- the data stored in the database.
-- •	DDL command is used to create the database schema while DML command is used
-- to populate and manipulate database
-- •	Comparing DDL vs DML, DDL statements affect the whole table whereas DML
-- commands only affect one or more rows.
-- •	In DDL, SQL Statement can’t be roll backed while in DML SQL Statement can be
-- a roll backed.
-- •	DDL is a declarative method while DML is an imperative method.
-- •	Important DDL commands are: 1) CREATE, 2) ALTER, 3) DROP, 4) TRUNCATE, etc.
-- while important DML commands are: 1) INSERT, 2) UPDATE, 3) DELETE, 4) MERGE, etc.



-- 2.Write SQL statements to create tables in the figure below:
create database lab2;
create table customers(
    id int not null unique,
    full_name varchar(50) not null,
    timestamp timestamp not null,
    delivery_address text not null,
    primary key (id)
);

create table orders(
    code int not null unique,
    customer_id int,
    total_sum double precision,
    is_paid boolean,
    primary key (code),
    foreign key (customer_id) references customers
);

create table products(
    id varchar not null unique,
    name varchar not null unique,
    description text,
    price double precision not null,
    primary key (id)
);

create table order_items(
    order_code int not null unique,
    product_id varchar not null unique,
    quantity int not null,
    primary key (order_code, product_id),
    foreign key (order_code) references orders,
    foreign key (product_id) references products
);




-- 3. Write SQL statements describing tables with appropriate data types
-- and constraints satisfying the following conditions
-- (maybe you need additional tables to store data atomically and efficiently):

-- a.a students table storing data such as full name, age, birth date,gender,
-- average grade, information about yourself, the need for a dormitory, additional info.

create table students(
    full_name varchar(50) not null,
    age int not null,
    birth_date timestamp,
    gender varchar(6),
    avg_grade double precision,
    info text not null,
    dorm bool not null,
    add_info text,
    primary key (full_name)
);

-- b.an instructors table storing data such as full name, speaking languages,
-- work experience, the possibility of having remote lessons.
create table instructors(
    full_name varchar(50) not null,
    languages text,
    work_exp text not null,
    remote_less bool not null,
    primary key (full_name)
);

-- c.a lesson participants table storing data such as lesson title,
-- teaching instructor, studying students, room number.
create table participants(
    title varchar(50),
    instructor_name varchar(50),
    student_name varchar(50),
    room_numb int,
    primary key (title),
    foreign key (instructor_name) references instructors
);

-- 4.Give examples of insertion, update and deletion of data on tables from exercise 2.
insert into customers values (3231, 'Aisha', '2021-09-12 09:24:18', 'Almaty');
update customers
    set full_name = 'hggkgj' where id = 3231;
delete from customers where full_name = 'hggkgj';
