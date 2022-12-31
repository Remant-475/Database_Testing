create database cqa111;
Use cqa111;
create table employee(
id int,Empname varchar(50),designation varchar(25),salary int)

select * from employee;
insert into employee(id,Empname,designation,salary) values(101,'Remant','QA',25000);
insert into employee(id,Empname,designation,salary) values(102,'Mayur','QA',25500);
insert into employee(id,Empname,designation,salary) values(103,'Santosh','Dev',25100);
insert into employee(id,Empname,designation,salary) values(104,'Omkaar','HR',25200);
insert into employee(id,Empname,designation,salary) values(105,'Anuj','ACC',14000);
insert into employee(id,Empname,designation,salary) values(106,'Shubham','Manager',30000);
insert into employee(id,Empname,designation,salary) values(105,'Abhay','Dev',13000);
delete from employee WHERE Empname='Omkaar';


select Empname,salary*12 as annualsalary from employee;
select Empname,salary/30 as Dailysalary from employee;
select Empname , salary % 2 as modulussalary from employee;
select Empname , salary+100 as increm_salary from employee;
select Empname , salary-500 as decre_salary from employee;

Alter table employee
add Hiredate date;

update employee
set Hiredate='2022-02-01' where id=101;

Alter table employee
add Dept_No int;

update employee
set Dept_No=50 where designation='Manager';

select * from employee where salary>20000;
select * from employee where salary<=15000;
select * from employee where  Designation!='QA'and Designation!='Dev';
select * from employee order by Empname ASC;
select * from employee order by salary DESC;


select * from employee where Designation='QA' and Dept_No=20;
select * from employee where Designation='QA' and salary>25000;
select * from employee where Dept_No=20 or Dept_No=30;
select * from employee where designation='QA'or designation='Manager';

create procedure Minsalary()
select min(salary) from employee;

call Minsalary();

create database spotifydb;
use  spotifydb;
create table user(
u_id varchar(50),name varchar(50),age int );
desc user;
alter table user
modify column u_id varchar(50) primary key;

insert into user (u_id,name,age) values ('317z3bhz25hfjafm63debgcak3zq','Remant',24);
insert into user (u_id,name,age) values ('210z8bjip56ghhary63dogcak9lh','Mayur',25);
insert into user (u_id,name,age) values ('185x45lz25hfhan63hujk2joj3th','Santosh',26);

update user
set u_id='spotify:user:317z3bhz25hfjafm63debgcak3zq' where name='Remant';

select * from user;
create table playlist(
p_id varchar(50) primary key,uid varchar(50),p_name varchar(50), foreign key (uid) references user(u_id) );
desc playlist;

insert into playlist (p_id,uid,p_name) values ('3cPS3jM3VbQrONmpH6XyWu','317z3bhz25hfjafm63debgcak3zq','MyJollywood');
insert into playlist (p_id,uid,p_name) values ('06LfKcuMyeDEd7zuZqqsSf','317z3bhz25hfjafm63debgcak3zq','MyTollywood');
insert into playlist (p_id,uid,p_name) values ('03GUKcuharygold7zuZqqs','210z8bjip56ghhary63dogcak9lh','bollywood');



create table tracks(
t_id varchar(50) primary key,pid varchar(50),t_name varchar(50), foreign key (pid) references playlist(p_id) );
desc tracks;
insert into tracks (t_id,pid,t_name) values ('spotify:track:39m83gjG1lNr7Un0dJndFw','3cPS3jM3VbQrONmpH6XyWu','Wishlist');
insert into tracks (t_id,pid,t_name) values ('spotify:track:2Fv2injs4qAm8mJBGaxVKU','3cPS3jM3VbQrONmpH6XyWu','Tujhe Kitna Chahne Lage');
insert into tracks (t_id,pid,t_name) values ('spotify:track:6VBhH7CyP56BXjp8VsDFPZ','06LfKcuMyeDEd7zuZqqsSf','Kesariya');

select * from playlist;
SELECT * FROM user
Left JOIN playlist
ON user.u_id = playlist.uid
Left JOIN tracks
ON playlist.p_id = tracks.pid;

SELECT * FROM user
right JOIN playlist
ON user.u_id = playlist.uid
right JOIN tracks
ON playlist.p_id = tracks.pid;

SELECT * FROM user
inner JOIN playlist
ON user.u_id = playlist.uid
inner JOIN tracks
ON playlist.p_id = tracks.pid;

select *from User  Join playlist on playlist.uid= User.u_id join Tracks on playlist.p_id=tracks.pid;
select *from User cross Join Playlist ;

use cqa111;
select * from employee;
show tables;
begin;
insert into employee(id,Empname,designation,salary,Hiredate,Dept_No) values(108,'Harry','QA',28000,2022-05-15,20);
rollback;

begin;
insert into employee(id,Empname,designation,salary,Hiredate,Dept_No) values(108,'Harry','QA',28000,'2022-05-15',20);
savepoint harry;
update employee set salary=29000 where id=108;
rollback to harry;
rollback;

begin;
insert into employee(id,Empname,designation,salary,Hiredate,Dept_No) values(108,'Harry','QA',28000,'2022-05-15',20);
commit;
rollback;

use spotifydb;