create database bank;
show databases;

#using the database
use bank;
show tables;

#Importing the dataset and displaying 15 records
select * from bank_cust_data;
select * from bank.bank_cust_data limit 15;

#To count the number of rows present in the dataset
select count(*) from bank_cust_data;

#To find out the job category count for unemployed and retired
select job, count(*) from bank_cust_data
where job="retired" or job="unemployed" or job="student"
group by job;

#To find out education summary
select education, count(*) from bank_cust_data
group by education;


#Finding out the average, min and max age of the customers in the dataset
select avg(age) as Average_Age, min(age) as Minimum_Age,
max(age) as Maximum_Age from bank_cust_data;

select contact, count(*) as Other_Means from bank_cust_data
where contact = "unknown" group by contact;

select day, count(*) as Count from bank_cust_data
where day between 1 and 31 group by day;

#Average balance based on job and education
select education, job, avg(balance) from bank_cust_data 
group by job,education;

#Average balance for cellular contact
select avg(balance) from bank_cust_data
where contact="cellular"; 

#Job and marital status is single
select job, marital, count(*) from bank_cust_data 
where marital="single" group by job, marital;

#Housing and Job
select job, housing, count(*) from bank_cust_data
where housing ="yes" group by job, housing;

#Month
select month, count(*) from bank_cust_data
where y="yes" group by month;

#Contact and month
select month, contact, count(*) from bank_cust_data
where contact="telephone" and y="yes" 
group by month, contact;

#Average duration and job
select job, avg(duration) from bank_cust_data
group by job, duration;

#Education
select education, count(*) from bank_cust_data
where y="yes" group by education;

#Job and Loan
select job, loan, count(*) from bank_cust_data
where loan="yes" group by job, loan;

#Education and Avg balance
select education, avg(balance), count(*) from bank_cust_data
where y="yes" group by education;

#Job, marital, avg balance
select job, marital, avg(balance), count(*) from bank_cust_data
where marital="married" group by job, marital;

#month, job, education
select job, education, month, count(*) from bank_cust_data
where month="sep" group by education, job, month;

#marital and age
select marital, avg(age) from bank_cust_data
where marital="married";

#education and marital
select education, marital, count(*) from bank_cust_data
where education="primary" group by education, marital;
