--database view

/*
SELECT * from CovidDeaths
select * from CovidVaccinations
*/

--data we are using visalization

/*
SELECT country,date,total_cases,new_cases,total_deaths,population
from CovidDeaths
WHERE country='nepal'

*/


--total cases and total deaths in that country





-- SELECT country,SUM(CAST(total_cases as bigint)) as totalcases,SUM(CAST(total_deaths as bigint)) as totaldeaths--big int ma cast garnai parxa as total value ta dherai thulo aauxa
-- from CovidDeaths
-- WHERE total_cases is not NULL AND total_deaths is not NULL
-- GROUP BY country
-- ORDER by country 


--ratio of cases to death
--covid lagyo vanae death huni probability kati xa  ta or percentage k xa

-- SELECT country,SUM(CAST(total_cases as bigint)) as totalcases,SUM(CAST(total_deaths as bigint)) as totaldeaths,(SUM(CAST(total_deaths AS BIGINT)) / SUM(CAST(total_cases AS BIGINT)))*100 AS probability
-- from CovidDeaths
-- WHERE total_cases is not NULL AND total_deaths is not NULL
-- GROUP BY country
-- ORDER by country 




-- SELECT country, 
--        SUM(CAST(total_cases AS BIGINT)) AS totalcases, 
--        SUM(CAST(total_deaths AS BIGINT)) AS totaldeaths,
--        (CAST(SUM(CAST(total_deaths AS BIGINT)) AS float) / 
--         CAST(SUM(CAST(total_cases AS BIGINT)) AS float))*100 AS probability
-- FROM CovidDeaths
-- WHERE total_cases IS NOT NULL 
--   AND total_deaths IS NOT NULL
-- GROUP BY country
-- ORDER BY probability desc;


-- countries highest death count per population

-- select country,max(total_deaths) as x,max(population) as y,x/y as ratio --not allowed
-- from CovidDeaths

-- select country,max(total_deaths) as deaths,max(population) as popn,(CAST(max(total_deaths) as float)/CAST(max(population) as float))*100 as deathratio
-- from CovidDeaths
-- WHERE total_deaths is not null and population is not NULL
-- GROUP BY country
-- ORDER by deathratio DESC;

--yesko matlab yedi mailae 100 jana lyai tyo country ko vanae kati jana chai marxan



--use another table join oprns
--so we can view total populations and vaccinated persons on that populations


-- select CovidDeaths.country,max(CovidDeaths.population) as popn,max(CovidVaccinations.people_fully_vaccinated) as vaccinated,
-- (CAST(max(CovidVaccinations.people_fully_vaccinated) as float)/CAST(max(CovidDeaths.population) as float))*100 as percentagevaccinated,
-- CASE
--     when (CAST(max(CovidVaccinations.people_fully_vaccinated) as float)/CAST(max(CovidDeaths.population) as float))*100 >75 then 'verygood'
--     when (CAST(max(CovidVaccinations.people_fully_vaccinated) as float)/CAST(max(CovidDeaths.population) as float))*100 >50 then 'good'
--     else 'bad'
-- END
-- from CovidDeaths
-- JOIN CovidVaccinations
-- on CovidDeaths.country=CovidVaccinations.country
-- and CovidDeaths.date=CovidVaccinations.date
-- GROUP by CovidDeaths.country
-- order by percentagevaccinated DESC



--using ctes

-- WITH VaccinationData AS (
--     SELECT CovidDeaths.country, 
--            MAX(CovidDeaths.population) AS popn, 
--            MAX(CovidVaccinations.people_fully_vaccinated) AS vaccinated,
--            (CAST(MAX(CovidVaccinations.people_fully_vaccinated) AS FLOAT) / 
--             CAST(MAX(CovidDeaths.population) AS FLOAT)) * 100 AS percentagevaccinated
--     FROM CovidDeaths
--     JOIN CovidVaccinations
--         ON CovidDeaths.country = CovidVaccinations.country
--         AND CovidDeaths.date = CovidVaccinations.date
--     GROUP BY CovidDeaths.country
-- )
-- SELECT country, popn, vaccinated, percentagevaccinated,
--        CASE
--            WHEN percentagevaccinated > 75 THEN 'verygood' --aaba tyo lamo lekhi ranu pare na ni
--            WHEN percentagevaccinated > 50 THEN 'good'
--            ELSE 'bad'
--        END AS vaccination_status
-- FROM VaccinationData
-- ORDER BY percentagevaccinated DESC;



--using temptable

-- create TABLE #mytemp2
-- (
--     country varchar(100),
--     population bigint,
--     vaccinated bigint,
--     percentagevaccinated float
-- )


-- INSERT into #mytemp2
-- SELECT CovidDeaths.country, MAX(CovidDeaths.population) AS population, MAX(CovidVaccinations.people_fully_vaccinated) AS vaccinated, --yaa lekhya column name ra temp table ko column match hunai parxa
-- (CAST(MAX(CovidVaccinations.people_fully_vaccinated) AS FLOAT) / CAST(MAX(CovidDeaths.population) AS FLOAT)) * 100 AS percentagevaccinated
-- FROM CovidDeaths
-- JOIN CovidVaccinations
--         ON CovidDeaths.country = CovidVaccinations.country
--         AND CovidDeaths.date = CovidVaccinations.date
-- GROUP BY CovidDeaths.country


-- select * from #mytemp2






--views

/*

In SQL, a view is a virtual table based on the result-set of an SQL statement.

A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.

You can add SQL statements and functions to a view and present the data as if the data were coming from one single table.

A view is created with the CREATE VIEW statement. 




*/


/*
temp table vanae ko tyo session ko lagi matrai kaam lagxa
view lae chai kunai query ko result lai table jasari nai store garxa aani available sabbai session ma hunxa



*/



--vieew usage confidential data protet garna as student lai college ko entire db ta dinu vayae na
--so student lai chaini vatrai view banai dyo aani tyo view database ma store vako hunxa
--tyo view matra diyo oolai


CREATE view afghanview AS
select * from CovidDeaths WHERE country='Afghanistan'

--afghanistan ko manxae lai aaru ko data na dini

--view vanae ko real table haina but behave as table
--yedi kunai chane in original table vayo vanae view ko output ma ni tei change aauxa
--  https://www.youtube.com/watch?v=wciubfRhvtM




--yesari bhujam na view lae chai query ko result table ko rup ma dinxa
--tyo view vitra query ma j lekhya xa tyo nai aauxa
--view permanent hunxa
--yellae protection ra easy banauxa day to day task

