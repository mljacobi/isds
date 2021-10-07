select p.productname, o.orderdate
from products p left join orders o 
on o.orderdate
order by o.orderdate;

select p.productname,o.orderdate
from products p left join orders o
on o.orderdate
where productname='1940 Ford Pickup Truck'
order by o.orderdate desc;

select ordernumber, priceEach*quantityOrdered as total
from orderdetails
group by ordernumber
having total>5000;

select d.ordernumber, d.priceEach*quantityOrdered as total,o.status
from orderdetails d,orders o
group by ordernumber
having total>5000 and o.status='Shipped';


select p.productname, msrp*.8 as msrp,o.status
from products p,orders o
where msrp<80 
group by msrp
having o.status='Shipped';

select p.productname, p.buyPrice,d.priceEach
from products p,orderdetails d
where d.priceeach>=(p.buyprice*2);

select distinct p.productname, o.orderdate
from orders o,orderdetails d,products p
where o.ordernumber=d.ordernumber and p.productcode=d.productcode and dayofweek(o.orderdate)=2;

select count(p.productname)
from products p,orders o
where o.status='On Hold';

use mjaco32_database;

create view Houseforrent as
select o.fname,o.lname,p.type
from propertyforrent p,privateowner o
where p.ownerno=o.ownerno and p.type='House';