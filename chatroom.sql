create database netdemo;
use netdemo;
create table names(id varchar(16) primary key,name varchar(100) not null);
create table news(name varchar(100) not null,mestime timestamp not null,words varchar(200) not null);
 
create table imgs(name varchar(100) not null,data mediumblob);

create table files(id varchar(16) not null,filename varchar(200),data mediumblob);


insert into names values("000001","boss");
insert into  names values("000002","manager");
-- set sql_safe_updates =0;
-- select * from names;
-- delete from imgs;
-- delete from files;
-- delete from names;
-- delete from news;
