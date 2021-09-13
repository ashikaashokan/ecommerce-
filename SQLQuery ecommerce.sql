 create database e_commerce
use e_commerce
create table cart (cart_id int not null,primary key(cart_id));  --------------how to convert int to varchar-------

create table customer
(customer_id varchar (10) not null ,
 customer_name varchar  (50) not null,
 address  varchar (255) not null,
 city varchar (50) not null,
 state varchar (50) not null,
 phone_number numeric not null,
 primary key (customer_id),
 cart_id int not null,
 foreign key (cart_id) references cart (cart_id)
 );
 create table seller (seller_id varchar (30) not null primary key (seller_id),
 seller_name varchar (50) not null,
 seller_email varchar (50) not null, 
 );
 create table product ( product_id int not null primary key (product_id),
 brand varchar(50)not null,
 colour varchar (50) not null,
 ram varchar(5) not null,
 storage int not null,
 seller_id varchar (30) not null,
 foreign key (seller_id) references seller (seller_id)
 );
 alter table product add cost numeric(7) default '200';

 create table payment( payment_id varchar (10) not null, 
 payment_date  date not null,
 payment_type varchar(10) not null,
 customer_id varchar(10) not null,
 cart_id int not null,
  primary key (payment_id),
  foreign key (customer_id) references customer (customer_id),
  foreign key (cart_id) references cart (cart_id),
 );
 create table cart_item(favorite int not null,
 date_added date not null,
 cart_id int not null,
 product_id int not null,
  foreign key (cart_id) references cart (cart_id),
  foreign key (product_id) references product (product_id)
);
alter table cart_item add purchased varchar(3) default 'no';
----------cart_id value-----------
 insert into cart(cart_id)
 values (1);
 insert into cart(cart_id)
 values (2);
 insert into cart(cart_id)
 values (3);
 insert into cart(cart_id)
 values (4);
 insert into cart(cart_id)
 values (5);
 select*from cart_item
 --------------customer_id---------

  insert into customer(customer_id,customer_name,address,city,state,phone_number,cart_id)
 values ('c1','danny','tnagar','chennai','tamilnadu','6738835489','1');
 insert into customer(customer_id,customer_name,address,city,state,phone_number,cart_id)
 values ('c2','haritha','annanagar','ncr','delhi','98735489','2');
 insert into customer(customer_id,customer_name,address,city,state,phone_number,cart_id)
 values ('c3','shiva','triplicane','shivajinagar','bengaluru','987735489','3');
 insert into customer(customer_id,customer_name,address,city,state,phone_number,cart_id)
 values ('c4','ashwath','mylapore','mahe','kerala','9858835489','4');
 insert into customer(customer_id,customer_name,address,city,state,phone_number,cart_id)
 values ('c5','akash','alwarpet','coimbatore','tn','6736789759','5');
 select*from customer

 -------------seller_id--------
   insert into seller(seller_id,seller_name,seller_email)
 values ('s1','aaaa','aaaaaaaa7@gmail.com');
  insert into seller(seller_id,seller_name,seller_email)
 values ('s2','bbbbb','bbbbb8@gmail.com');
  insert into seller(seller_id,seller_name,seller_email)
 values ('s3','nnnn','nnnnnn8@gmail.com');
  insert into seller(seller_id,seller_name,seller_email)
 values ('s4','lllls','llllllls9@gmail.com');
  insert into seller(seller_id,seller_name,seller_email)
 values ('s5','jjjjjjj','jjjjjjjj10@gmail.com');
 select*from seller

 --------------product-------------
  insert into product(product_id, brand,colour, ram, storage,seller_id)
 values ('10001','iphone','pink','6GB','128','s5',15060);
 insert into product(product_id, brand,colour, ram, storage,seller_id)
 values ('10002','samsung','blue','8GB','253','s2',12000);
 insert into product(product_id, brand,colour, ram, storage,seller_id)
 values ('10003','nokia','red','8GB','110','s1',15890);
 insert into product(product_id, brand,colour, ram, storage,seller_id)
 values ('10004','oneplus','yellow','6GB','160','s3',20000);
 insert into product(product_id, brand,colour, ram, storage,seller_id)
 values ('10005','redmi','orange','8GB','120','s4',30000);
 select*from product

 -----------------payment------------
  insert into payment(payment_id,payment_date, payment_type,customer_id,cart_id)
 values ('pyA','2021-10-07 ','cash','c1','5');
 insert into payment(payment_id,payment_date, payment_type,customer_id,cart_id)
 values ('pyB','2020-07-27 ','online','c5','1');
insert into payment(payment_id,payment_date, payment_type,customer_id,cart_id)
 values ('pyC','2021-01-17 ','cash','c4','2');
insert into payment(payment_id,payment_date, payment_type,customer_id,cart_id)
 values ('pyD','2020-11-11 ','online','c3','3');
insert into payment(payment_id,payment_date, payment_type,customer_id,cart_id)
 values ('pyD','2018-07-11 ','online','c2','4');
 select*from payment

 ---------cart_item--------
  insert into cart_item values ('5463','2018-07-11','2','10005','yes');
  insert into cart_item values ('8734','2020-11-11','1','10004','yes');
  insert into cart_item values ('9563','2021-01-17','5','10003','yes');
  insert into cart_item values ('1254','2020-07-27','4','10002','yes');
  insert into cart_item values ('5643','2021-10-07','3','10001','yes');
 select*from cart_item


 ---- TO FIND ORDER HISTORY-----
 
 select product_id,favorite  from cart_item where( purchased='yes' and cart_id in (select cart_id from customer where customer_id='c5'))

 --------customer wants to see details order history-----
  
  select* from product where product_id in (select product_id from cart_item where (cart_id in (select cart_id from customer where customer_id = 'c4')));
  

  -----------customer wants to see filter item ( colour,ram)---------
  select product_id ,seller_id,brand from product where(colour ='pink'and ram ='6GB');

  --------if admin wants to see what are the product purchased on the particular date----
  select product_id from cart_item where(purchased ='yes' and date_added ='2021-01-17');

  ----------how many product sold on a particular date--------

  select count(product_id)product_sold,date_added from cart_item where purchased ='yes' group by (date_added);

