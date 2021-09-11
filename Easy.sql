--#1
/*
Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA. 
*/
Select name 
From CITY
Where countrycode = 'USA' And population > 120000;

--#2
/*
Query all columns (attributes) for every row in the CITY table.
*/
Select * From CITY;

--#3
/*
Query all columns for a city in CITY with the ID 1661.
*/
Select * From city Where ID = 1661;

--#4
/*
Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN. 
*/
Select * From CITY Where COUNTRYCODE = 'JPN';

--#5
/*
Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN. 
*/
Select name From city Where countrycode = 'JPN';

--#6
/*
Query a list of CITY and STATE from the STATION table. 
*/
Select city, state From station;

--#7
/*
Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer. 
*/
Select DISTINCT(city) From station Where MOD(ID,2)= 0;

--#8
/*
Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table. 
*/
Select COUNT(city)-COUNT(DISTINCT city) From station;

--#9
/*
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically. 
*/
Select city, LENGTH(city)
From station
Order by LENGTH(city) asc, city limit 1;
Select city, LENGTH(city)
From station
Order by LENGTH(city) desc, city limit 1;

--#10
/*
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
*/
/* SOLUTION 1 */
SELECT DISTINCT city
FROM station
WHERE city LIKE 'A%'
  OR  city LIKE 'E%'
  OR  city LIKE 'I%'
  OR  city LIKE 'O%'
  OR  city LIKE 'U%';
/* SOLUTION 2 */
SELECT DISTINCT city 
FROM station 
WHERE LEFT(city,1) IN ('A','E','I','O','U');

--#11
/*
Query the list of CITY names ending with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
*/
/* SOLUTION 1 */
SELECT DISTINCT city
FROM station
WHERE city LIKE '%a'
  OR  city LIKE '%e'
  OR  city LIKE '%i'
  OR  city LIKE '%o'
  OR  city LIKE '%u';
/* SOLUTION 2 */
SELECT DISTINCT city 
FROM station 
WHERE RIGHT(city,1) IN ('A','E','I','O','U');

--#12
/*
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
Your result cannot contain duplicates.
*/
SELECT DISTINCT city 
FROM station 
WHERE RIGHT(city,1) IN ('A','E','I','O','U')
  AND LEFT(city,1) IN ('A','E','I','O','U');

--#13
/*
Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT city 
FROM station 
WHERE LEFT(city,1) NOT IN ('A','E','I','O','U');

--#14
/*
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT city 
FROM station 
WHERE RIGHT(city,1) NOT IN ('A','E','I','O','U');

--#15
/*
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT city 
FROM station 
WHERE RIGHT(city,1) NOT IN ('A','E','I','O','U')
   OR LEFT(city,1) NOT IN ('A','E','I','O','U');

--#16
/*
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT city 
FROM station 
WHERE RIGHT(city,1) NOT IN ('A','E','I','O','U')
  AND LEFT(city,1) NOT IN ('A','E','I','O','U');

--#17
/*
Query the Name of any student in STUDENTS who scored higher than Marks. 
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
*/
SELECT name
FROM students
WHERE marks > 75
ORDER BY RIGHT(name,3), ID;

--#18
/*
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
*/
SELECT name
FROM employee
ORDER BY name;

--#19
/*
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than 10 months. 
Sort your result by ascending employee_id.
*/
SELECT name
FROM employee
WHERE salary > 2000 
  AND months < 10
ORDER BY employee_id asc;

--#20
/*
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 
Output one of the following statements for each record in the table:
 Equilateral: It's a triangle with 3 sides of equal length.
 Isosceles: It's a triangle with 2 sides of equal length.
 Scalene: It's a triangle with 3 sides of differing lengths.
 Not A Triangle: The given values of A, B, and C don't form a triangle.
*/
SELECT 
 CASE 
  WHEN (a+b<=c OR a+c<=b OR b+c<=a) THEN 'Not A Triangle'
  WHEN (a=b AND b=c) THEN 'Equilateral'
  WHEN (a=b OR a=c OR b=c) THEN 'Isosceles'
  ELSE 'Scalene'
 END
FROM triangles;

--#21
/*
Query a count of the number of cities in CITY having a Population larger than 100,000. 
*/
SELECT COUNT(DISTINCT id)
FROM city
WHERE population > 100000;

--#22
/*
Query the total population of all cities in CITY where District is California. 
*/
SELECT SUM(population)
FROM city
WHERE district = 'California';

--#23
/*
Query the average population of all cities in CITY where District is California.
*/
SELECT AVG(population)
FROM city
WHERE district = 'California';

--#24
/*
Query the average population for all cities in CITY, rounded down to the nearest integer.
*/
SELECT AVG(population)
FROM city;

--#25
/*
Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
*/
SELECT SUM(population)
FROM city
WHERE countrycode = 'JPN';

--#26
/*
Query the difference between the maximum and minimum populations in CITY.
*/
SELECT MAX(population)-MIN(population)
FROM city;

--#27
/*
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's 0 key was broken until after completing the calculation. 
She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
Write a query calculating the amount of error (i.e.:(actual-miscalculated)average monthly salaries), and round it up to the next integer.
*/
SELECT CAST(CEILING((AVG(CAST(salary AS Float)) - AVG(CAST(REPLACE(salary, 0, '')AS Float)))) AS INT)
FROM employees;
/* The answer provided is 2253. */

--#28
/*
We define an employee's total earnings to be their monthly "Salary * Months worked", and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 
Then print these values as 2 space-separated integers.
*/


