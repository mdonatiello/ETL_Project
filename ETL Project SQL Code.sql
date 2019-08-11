-- This query shows the total of all crimes across the US
Create Table TBL001 as
SELECT Sum(summary.MURDER) AS SumOfMURDER, Sum(summary.RAPE) AS SumOfRAPE, Sum(summary.ROBBERY) AS SumOfROBBERY, Sum(summary.AGASSLT) AS SumOfAGASSLT, Sum(summary.BURGLRY) AS SumOfBURGLRY, Sum(summary.LARCENY) AS SumOfLARCENY, Sum(summary.MVTHEFT) AS SumOfMVTHEFT, Sum(summary.ARSON) AS SumOfARSON
FROM summary;

-- This query shows the total of allincome vs crime rate
Create Table TBL002 as
SELECT summary.State code, summary.County, summary.TotalPop, summary.Income, summary.IncomePerCap, summary.crime_rate_per_100000
FROM summary;

-- This query shows the total of all Poverty vs Crime Rate
Create Table TBL003 as
SELECT summary.State_code, Avg(summary.crime_rate_per_100000) AS Crime_per_100k, Avg(summary.Poverty) AS Poverty
FROM summary
GROUP BY summary.State_code;

-- This query shows the total of all Top and Bottom 10
Create Table TBL004A as
SELECT summary.State_code, Avg(summary.Income) AS Average_Income, Sum(summary.Murder) AS Murder, Sum(summary.Rape) AS Rape, Sum(summary.Robbery) AS Robbery, Sum(summary.AGASSLT) AS Aggrevated_Assult, Sum(summary.Burglry) AS Burglery, Sum(summary.Larceny) AS Larceny, Sum(summary.MVTHEFT) AS Auto_Theft, Sum(summary.Arson) AS Arson
FROM summary
GROUP BY summary.State_code
ORDER BY Avg(summary.Income) DESC
fetch first 10 rows only;

-- This query shows the total of all Top and Bottom 10
Create Table TBL004B as
SELECT summary.State_code, Avg(summary.Income) AS Average_Income, Sum(summary.Murder) AS Murder, Sum(summary.Rape) AS Rape, Sum(summary.Robbery) AS Robbery, Sum(summary.AGASSLT) AS Aggrevated_Assult, Sum(summary.Burglry) AS Burglery, Sum(summary.Larceny) AS Larceny, Sum(summary.MVTHEFT) AS Auto_Theft, Sum(summary.Arson) AS Arson
FROM summary
GROUP BY summary.State_code
ORDER BY Avg(summary.Income)
fetch first 10 rows only;

-- This query shows the total of all Worker type vs crime rate
Create Table TBL005 as
SELECT summary.State, Count(summary.County) AS Counties, Sum(summary.TotalPop) AS Population, Sum(summary.Employed) AS Total_Employed, Sum((SelfEmployed/100)*employed) AS Self_Employed, Sum((unemployement/100)*TotalPop) AS Unemployed, Avg(summary.crime_rate_per_100000) AS crime_rate_per_100000, Sum(summary.MURDER) AS Murder, Sum(summary.RAPE) AS Rape, Sum(summary.ROBBERY) AS Robbery, Sum(summary.AGASSLT) AS Assault, Sum(summary.BURGLRY) AS Burglary, Sum(summary.MVTHEFT) AS Auto_Theft, Sum(summary.ARSON) AS Arson
FROM summary
GROUP BY summary.State;

