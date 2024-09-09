
-- creating the database
--CREATE DATABASE testdb;



--creating a table in database

/*
CREATE TABLE EmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50))

*/

--creating another table in database
/*
Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
)

*/



--Inserting values into table 1:EmployeeDemographics
--yedi kunai column ko data xutyo vanae yei error aauxa
--row wise value halni yeuta tuple banaudai

/*

Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

*/


--insertig to another table:EmployeeSalary
/*
Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

*/


--Select statements in sql

--Defines which column to return

--if we want FirstName Column
--SELECT FirstName FROM EmployeeDemographics

--if we want every columns from our database
--SELECT * FROM EmployeeDemographics

--top in sql
--if we have a large database we cannot view full database we may 
--just want to view top 5(say) data only
--syntax=select top(5) *(you can replace * with your required columns too) from table
--SELECT TOP(5) FirstName from EmployeeDemographics
--table ma jasto order ma xa or jun paila xa tei display haru vai raa xa





--distinct in sql
--Inside a table, a column often contains many duplicate values; and sometimes you only want to list the different (distinct) values.
/*
Syntax
SELECT DISTINCT column1, column2, ...
FROM table_name;
vanae xi pratyek column ko distinct value dini vayo
*/

/*

SELECT DISTINCT FirstName,LastName
FROM EmployeeDemographics;

*/




--count
/*
the COUNT() function returns the number of rows that matches a specified criterion.
*/

--Find the total number of rows in the EmployeeDemographics table:
--tala ko ma condition ta dya xaina tara sabbai column vanae ko xa
--so kati oota rows xa tyo nai return garni vayo


/*
select count(*)
from EmployeeDemographics
*/


--counting in some columns

/*
select count(FirstName) 
from EmployeeDemographics

*/






--As (alias )
--it you want to give the returned column to have some name

/*
SQL Aliases
SQL aliases are used to give a table, or a column in a table, a temporary name.

Aliases are often used to make column names more readable.

An alias only exists for the duration of that query.

An alias is created with the AS keyword.

Actually, in most database languages, you can skip the AS keyword and get the same result:



*/

/*
select count(LastName) as lastcount --yo alias na diye count ma no column name vanae ra aauxa
from EmployeeDemographics

*/


--giving alias to the table
/*
select * 
FROM EmployeeDemographics as table1;
*/



--yo muni ko chai garna paidaina feri

/*
select *
from table1;

*/




--Max

--if you want a maximun value in tat column
--The MAX() function returns the largest value of the selected column

/*

select MAX(Salary)
from EmployeeSalary

*/



--min

/*
select MIN(Salary)
from EmployeeSalary
*/






--Avg(Average)
--The AVG() function returns the average value of a numeric column.

/*
select AVG(Salary)
from EmployeeSalary
*/


--note it can return float too




--from statement

--if we are inside of another database but waht to access another database we use
--sellect * from your_database_name.your_database_table(dbo.table_name yesari basya hola)

--select * from testdb.dbo.EmployeeDemographics
--so yo mathi ko query lai master database or any other database select garda pani run garauna milxa






--WHERE statement
-- It helps you retrieve only those rows that satisfy the given criteria.


--example with operators

/*
=	Equal	
>	Greater than	
<	Less than	
>=	Greater than or equal	
<=	Less than or equal	
<>	Not equal. Note: In some versions of SQL this operator may be written as !=	
BETWEEN	 Between a certain range	
LIKE	 Search for a pattern	
IN	 To specify multiple possible values for a column

*/

--tyo first 5 ta normal nai xan kunai yeuta try garam

--select * from EmployeeDemographics WHERE age<=30;
--so give every row which has age less than or equal to 30



--not equal to <>
--select * from EmployeeDemographics WHERE Gender<>'Male';
--note single quotation matrai launa painxa
--double quotation ma error aauxa
--so yedi varchar ho vanae single quotation
--the above query gives all rows that has gender that is not equal to male



--yesai ma aauxa subquery ko concept
--https://www.youtube.com/watch?v=5O2OuN1ougU
--watch this video

--hamlai kunai salaary ko avg garyou vanae yeuta row ra yeuta column ma nai ta value aauxa ni
/*
select avg(Salary)
from EmployeeSalary
*/


--yellae result dyo 485555
--aaba hamalai tyo manxae ko data chaiyo jasko salary more than this average vanae ra aayo vanae
--we have 2 options 


--option 1


/*
select *
from EmployeeSalary
WHERE Salary>48555
*/

--yo milna ta milxa tara useful hudaina
--as kunai data aad vayo vanae feri calculate gare ra yaa modify garnu parxa


--2nd approach
--as avg lae yeuta ta value vako table return garxa
--where clause ma tyo yeuta value vako table sanga comparison garna ni milxa
--ueuta value aauxa vanae subquery bata tyo equal to ,greater query haru lae compare garna milxa
--yedi dherai value aako xa vanae pani compare garna milxa tesko muni lekhae ko xa
--so this below is the suitable approach


/*
select * 
from EmployeeSalary
WHERE Salary>(select avg(Salary) from EmployeeSalary)
*/




--IN (used in where)
--To specify multiple possible values for a column
--determines if specified value matches any values in subquery or list

--lets see list first

/*
select * 
from EmployeeDemographics
where Age IN (30,31,32)
*/


--so it returns those rows that cointains age as 30 or 31 or32
--this can alo be done using or i think





-- in (used in where) with subquery
--yedi yeutai column return vai ra xa vanae
--column ma jati value vayae ni matlab xaina huna chai yeuta column hunu paryo

/*
select *
from EmployeeDemographics
WHERE EmployeeID IN
(select EmployeeID from EmployeeDemographics)

*/


-- as (select EmployeeID from EmployeeDemographics)
--yellae yeuta column aaunxa
--so aaba  employeeid in (tyo column ma vako valaue tuple ma convert vayo vanthanam)
--(single column) gardai ma tuple ma jani chai haina raixa 
--tai pani bhujna lai single column lai IN operator use gare ra compare garna milxa
--this is also subquery






--between(used in where)
/*

The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.

The BETWEEN operator is inclusive: begin and end values are included.

Syntax
SELECT column_name
FROM table_name
WHERE column_name BETWEEN value1 AND value2;



*/

/*
select * from EmployeeSalary where Salary BETWEEN 40000 AND 50000
*/

--between can be used in string too study yourself





--like(used in while)
/*
The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

There are two wildcards often used in conjunction with the LIKE operator:

 The percent sign % represents zero, one, or multiple characters
 The underscore sign _ represents one, single character

 name like %a vanyo vanae last ma a hunu paryo tyo vanda aagadi j vayae ni hunxa aani kei na vayae ni hunxa
 yedi kei hunai parxa vanni chaiyo vanae name like _a

https://www.w3schools.com/sql/sql_like.asp

*/

/*
select *
from EmployeeDemographics
WHERE FirstName LIKE '%m'
*/

--mathi ko lae last ma m vako first name de vanae ko

/*
select *
from EmployeeDemographics
WHERE FirstName LIKE '_e%'
*/

--yellae vanae ko aagadi kunai yeuta character most ,aani e aani paxadi vayae ni na vayae ni j pani


--and ,or ,not (used in where)
/*
Example
Select all Spanish customers that starts with either "G" or "R":


yo mini ko w3schools bata copy garya ho run chai hunna
bhujan lai matrai
SELECT * FROM Customers
WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');



*/

--not(used in where)

/*

Syntax
SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;

*/


/*
select *
from EmployeeDemographics
where not FirstName='Jim'

*/

--yei garna lai <> garna ni milxa


/*
select *
from EmployeeDemographics
where  FirstName<>'Jim'

*/


--yedi mathi ko jasto like ,between,in ma not garnu pare
--age not (between,in,like)
--vanae ko age paxadi chai xa

--yedi tyo  greater ,smaller...... na not launu pare chaai
--not age<30
--vanae xi age is not less than thirty(then greater than 30)


/*
select *
from EmployeeDemographics
WHERE not Age<31
*/














--order by
/*

The ORDER BY keyword is used to sort the result-set in ascending or descending order
The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.
For string values the ORDER BY keyword will order alphabetically:



*/

/*
select * 
from EmployeeDemographics
ORDER BY Age
*/

/*

ORDER BY Several Columns

if 2 rows or persons have same age in above case
aaba teso vayae tyo duita lai pani kasari arragnge garni vanna milxa
eg if age yeutai xa vanae ma aarko column say Gender linxu aani gender ko descending order ma arrange garxu
 This means that it orders by Age, but if some rows have the same Age, it orders them by Gender:


*/


/*
select * 
from EmployeeDemographics
ORDER BY Age ASC,Gender DESC

*/





--limit and offset
/*
The LIMIT clause in SQL allows users to control the amount of data retrieved and displayed in the result set.

its like top statement
yo yesma support hudaina jasto xa

offset lae chai kun row bata dekhauni vanxa


*/

/*
select top(5) *
FROM EmployeeDemographics

--or
select *
from EmployeeDemographics
offset 5;

*/









--if you want a single specified row use this technique
--if want 3rd highest salary


/*
yeuta table yesto lyanu paryo jun ko top ma tyo row hos

yedi paila ma table lai sort garxu salary ko aadhar ma descending order ma
aani aako table bata top 3 value matra retrive garxu
aaba tyo table ko last ma 3rd highest salary xa

aaba yellai oolto banaidyo vanae matlab ascending of salary ko aadhar ma arrange garyo vanae 
ie:tyo tin oota ma sano salary ta tei last wala kai hunxa


so yo table ko top 1 value chai tannu paryo

tala example xa bhujini



*/

select *
from EmployeeSalary
ORDER BY Salary DESC

--note 3rd highest=50000


--aaba yo bata top 3 matrai lim
select top(3) *
from EmployeeSalary
ORDER BY Salary DESC


--yo aako table lai oolto banam
select *
FROM (select top 3 * from EmployeeSalary ORDER BY Salary DESC) AS table1
order by Salary ASC

--as chai dinu pardo raixa  tyo table lai



--so finally 
--aaba yesko top 1 xanam

select top(1) *
FROM (select top 3 * from EmployeeSalary ORDER BY Salary DESC) AS table1
order by Salary ASC


--so 50000 aayo


--yo technique lae kunai pani row retrive garna milxa

--also yedi limit offest dini raixa vanae tyo database le chaeck garni 
--kasai lae vanae ko thayyaki row haru retrive garna sajilo hunxa

















