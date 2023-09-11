/*
Revising the Select Query I
Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA. 
*/
SELECT * FROM city
WHERE countrycode="USA"
  AND population > 100000;


/*
Revising the Select Query II
Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA. 
*/
SELECT name FROM city
WHERE population > 120000
  AND countrycode = "USA";


/*
Select All
Query all columns (attributes) for every row in the CITY table.
*/
SELECT * FROM city;


/*
Select By ID
Query all columns for a city in CITY with the ID 1661.
*/
SELECT * FROM city
WHERE ID = 1661;


/*
Japanese Cities' Attributes
Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN. 
*/
SELECT * FROM city
WHERE countrycode = "JPN";


/*
Japanese Cities' Names
Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN. 
*/
SELECT name FROM city
WHERE countrycode = "JPN";


/*
Weather Observation Station 1
Query a list of CITY and STATE from the STATION table. 
*/
SELECT city, state FROM station;


/*
Weather Observation Station 3
Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer. 
*/
SELECT DISTINCT(city) FROM station
WHERE MOD(ID,2)=0;


/*
Weather Observation Station 4
Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table. 
*/
SELECT COUNT(city)-COUNT(DISTINCT(city)) FROM station;


/*
Weather Observation Station 6
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
*/
SELECT DISTINCT(city) FROM station
WHERE LEFT(city,1) IN ("a","e","i","o","u");


/*
Weather Observation Station 7
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
*/
SELECT DISTINCT(city) FROM station
WHERE RIGHT(city,1) IN ("a","e","i","o","u");


/*
Weather Observation Station 8
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
*/
SELECT DISTINCT(city) FROM station
WHERE LEFT(city,1) IN ("a","e","i","o","u")
  AND RIGHT(city,1) IN ("a","e","i","o","u");


/*
Weather Observation Station 9
Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT(city) FROM station
WHERE LEFT(city,1) NOT IN ("a","e","i","o","u");


/*
Weather Observation Station 10
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT(city) FROM station
WHERE RIGHT(city,1) NOT IN ("a","e","i","o","u");







/*
Weather Observation Station 5
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically. 
*/
select city, length(city) from station
order by length(city),city asc
limit 1;
select city, length(city) from station
order by length(city) desc
limit 1;
