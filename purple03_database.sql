use purple03_database;

Create table STORE(
Name varchar(100) not null,
Location varchar(100) not null,
Hours varchar(10),
Sqfeet varchar(5),
Primary key (name,location));

Create table USER(
Userid varchar (10) not null,
Firstname varchar (20),
Lastname varchar (20),
Mobile varchar (100),
Address varchar (100),
City varchar (100),
Zipcode varchar (10),
Primary key (userid));

Create table VISIT(
Datetime varchar(20) not null,
Purpose varchar (20),
Name varchar (100),
Location varchar (100),
Userid varchar (10),
Primary key (datetime),
constraint fk_visit_name foreign key (name,location) references STORE(name,location),
Constraint fk_visit_userid foreign key (userid) references USER(userid));

Create table REWARD(
Rewardid varchar(10) not null,
Amount varchar (100),
Type varchar(10),
Expirationdate varchar (10),
status varchar (10),
Primary key (rewardid));

Create table POINT(
Pointid varchar(10) not null,
Amount varchar (100),
Expdate varchar(10),
Status varchar(10),
Rewardid varchar(10),
Userid varchar(10),
Primary key (pointid),
Constraint fk_earns_rewardid foreign key (rewardid) references REWARD(rewardid),
Constraint fk_earns_userid foreign key (userid) references USER(userid));


Create table EMPLOYEE(
Employeeid varchar(10) not null,
Fname varchar (10),
Lname varchar (10),
Email varchar(10),
Mobile varchar(100),
Name varchar (100),
Location varchar(100),
Primary key (employeeid),
Constraint fk_has_name foreign key (name,location) references STORE(name,location));

Create table ITEM(
Itemid varchar (20) not null,
Itemname varchar (100),
Price varchar (10),
Orderid varchar (10),
Primary key (itemid),
Constraint fk_has_orderid foreign key(orderid) references ORDERS(orderid));



Create table ORDERS(
Orderid varchar(10) not null,
Date date,
Value varchar(10),
Employeeid varchar(10),
Userid varchar(10),
Itemid varchar(10),
Primary key (orderid),
Constraint fk_takes_employeeid foreign key(employeeid) references EMPLOYEE(employeeid),
Constraint fk_takes_userid foreign key(userid) references USER(userid),
Constraint fk_has_itemid foreign key(itemid) references ITEM(itemid));

