--intermediate course

--link
--  https://www.youtube.com/watch?v=Yh4CrPHVBdE&t=254s



--inner join

/*
select * FROM
dbo.EmployeeDemographics 
INNER JOIN dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
*/

/*

join matrai lekhnu ra inner join lekhnu yesutai ho

yellae employee id compare garxa

yedi dui ootai ma xa vanae matrai tyo row return

select * FROM
(dbo.EmployeeDemographics 
INNER JOIN dbo.EmployeeSalary)
on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

yellai yesari chai bhujni


*/





--full outer join
--dui ootai table ko  match vako jati matching ma
--natra null vayae ra pani sabbai


/*

select * FROM
dbo.EmployeeDemographics 
full outer JOIN dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID


*/



--left join
--left table or first ma jun mention garya xa tesko sabbai 
--matching right ko xa vanae

/*
select * FROM
dbo.EmployeeDemographics 
LEFT JOIN dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
*/

--right join

/*
select * FROM
dbo.EmployeeDemographics 
RIGHT JOIN dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

*/


--yedi specific column matrai chaiyo from certain table in join
--then do
--select table1.column1,table2.column3  from ........

/*

select EmployeeSalary.EmployeeID,EmployeeDemographics.Age FROM
dbo.EmployeeDemographics 
full outer JOIN dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

*/


--union and union all

/*

union join jastai ho 2 oota table combine garna kaam lagxa
union chai yedi dui oota table ma sabbai column exact same xa vanae kaam lagxa
union lae chai yeuta table ko muni data add gardinxa aarko table ko
video herni thyakkai xa 
union all le chai duplicate vayae pani dekhauxa
union le chai duplicate xa vanae teslai yeuta manxa
hami sanga sabbai column yeutai vako table xaina so demo ko lagi video nai herni
https://www.youtube.com/watch?v=PSNXoAs2FtQ&t=3090s

*/




--case statements and use cases

--use cases vane ko if else jastai ho
--if yesto vayo vanae yesto gara vaninxa
--yesto gara vanae ko kura chai naya column banae ra aauxa

--eg



/*

SELECT FirstName,LastName,Age,   --age paxadi comma xa
CASE
    WHEN Age>30 THEN 'old'   --if vanya yo  aani indent xa case ma  also if ma xirae paxi paxadi ko herdaina elif ma xirdaina
    when age between 27 and 30 then 'young'  --elif vanya jasto
    ELSE 'baby'    --elase vanya jasto
END              --end na birsini
from dbo.EmployeeDemographics
WHERE Age is NOT NULL


*/



--practicce  giving raises to different persions according to the job they do 
--give more raise to salesmen ...

--select * from EmployeeDemographics
--SELECT * from EmployeeSalary



--lets say we want to raise salary of salesman oly by 10%

/*
select EmployeeDemographics.FirstName,EmployeeSalary.JobTitle,EmployeeSalary.Salary,
CASE
    when EmployeeSalary.JobTitle='Salesman' then EmployeeSalary.Salary+(EmployeeSalary.Salary*0.1)
    else EmployeeSalary.Salary
END as updatedsalary
from EmployeeDemographics
join EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID


*/






--updating the table
--SELECT * from EmployeeDemographics

--lets change age of meredith to 31


/*
UPDATE EmployeeDemographics
set Age=31  --,EmployeeID=1010
WHERE FirstName='Meredith'

*/


--delete
--to delete a row


/*
DELETE from EmployeeDemographics
WHERE EmployeeID=1007 --yedi yo where clause xutyo vanae entire table nai oodxa
--so paila delete garnu aadagi delete keyword ko satta select lekhni
--yedi tei delete garna khojya ho vanae balla select ko thau ma delete lekhni

select * from EmployeeDemographics

*/



--combining 2 columns into one


/*
select FirstName+''+LastName as fullname
FROM EmployeeDemographics
*/




--ctes (common table expressions)

/*
yellae chai yeuta query ko result lai yeuta table ko rup ma lina help garxa
also note that yo katai sotre hudaina
bas yellai jati choti chaiyo teti choti nai execute gari ranu parxa
aani yo sakkini bittikai select statement on this cte hunu parxa
bich ma kei garxu aani paxi cte ma select garxu vanna paidaina


*/

--with lekhae ra banainxa cte
/*
with my_cte as 
(
select FirstName+''+LastName as fullname
from EmployeeDemographics

)--yo paxi select vai halnu parxa
select * from my_cte --select form my_cte garna kaam lagxa vanam subquery jasati gari
*/





--temp_tables

--creation yesko farak vanae ko baas yesma # sign use hunxa aagdai query ma 

/*
create TABLE #temp_employee   --# temp table ko nam diya xa
(
EmployeeID int,
JobTitle VARCHAR(100),
Salary int

)
*/




--usage kunai table ko data yo temp table ma lyae ra halni aani yesma chai kaam garni
/*
INSERT into #temp_employee
select *
from EmployeeSalary


select * from #temp_employee
*/

--note temp tables are stored somewhere








--string functions

--error vako table banam

/*
CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

*/

--Select * From EmployeeErrors


--tya employee id ko aagadi space xa
--tyo space hatauna trim garnu parxa

--select EmployeeID,TRIM(EmployeeID) from EmployeeErrors

--yedi ltrim garyo vaea left space hatauxa rtrim lae right ko
--trim matrai le sabbai




--replace  (which_column,which value to replace,replace with what)
--last name ma fired xa ni tyo dherai ko ma hua sakxa so yek yek oota ma update garna sakinna so use replace
--select LastName,REPLACE(LastName,'- Fired','') from EmployeeErrors




--lower,upper(columnnane)  yini haru ni functions hun










--stored preocedure
--yesvitra kunai query halya hunxa
--jati chiti yo stored procedure run garayo teti nai choti tyo stored query ko result aauxa

/*
CREATE PROCEDURE my_procedure
AS
SELECT *
from EmployeeDemographics



EXEC my_procedure--execute gare ko aani yo store hunxa programability ko stored procedures vitra

*/
--stored procedure vitra create aani insert j j gare i painxa 


--inputs to stored procedure

/*
CREATE PROCEDURE inp_procedure
@value1 int
AS
CREATE TABLE test_table(
id1 INT
)
INSERT into test_table VALUES
(@value1)

select * from test_table


EXEC inp_procedure @value1=10

*/




--group by

-- https://www.youtube.com/watch?v=zgYqUP_PhQo

/*
group by lae kun columns dya xa tesko disctinct value ko group banauxa
aani tyo group ma chai hamlae aggregrate function haru launa milxa ie:
min,max,sum,count

yedi gropup by x garya xa vanae 

sellect ma x,or aggregrate on x hunu parxa aaru columns haru garna paidaina

gropup multiple columns ma ni garna milxa

tyo mathi ko video ma herni 3:41 jati ma xa

simple nai xa


*/












