/*
The PADS
Generate the following two result sets:

    Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
    
    Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
    There are a total of [occupation_count] [occupation]s.
    where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.
*/
SELECT CONCAT(name, "(", LEFT(occupation,1), ")") FROM occupations
ORDER BY name ASC;

SELECT CONCAT("There are a total of ", COUNT(*), " ", LOWER(occupation), "s.") FROM occupations
GROUP BY occupation
ORDER BY COUNT(*), occupation ASC;
-- CONCAT function should be used to eliminate the spaces.


/*
Weather Observation Station 18
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.

a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the Manhattan Distance between points P1 and P2, and round it to a scale of 4 decimal places.
*/
SELECT ROUND((ABS(MIN(lat_n)-MAX(lat_n))+ABS(MIN(long_w)-MAX(long_w))),4) FROM station;


/*
Weather Observation Station 19
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
Query the Euclidean Distance between points P1 and P2, and format your answer to display 4 decimal digits.
*/
SELECT ROUND(SQRT(POWER((MIN(lat_n)-MAX(lat_n)),2)+POWER((MIN(long_w)-MAX(long_w)),2)),4) FROM station;


/*
Binary Tree Nodes
You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:
    Root: If node is root node.
    Leaf: If node is leaf node.
    Inner: If node is neither root nor leaf node.
*/
SELECT N, CASE
            WHEN P IS NULL THEN "Root"
            WHEN N IN (SELECT P FROM BST) THEN "Inner"
            ELSE "Leaf"
          END
          FROM BST
ORDER BY N ASC;
-- NOT IN won't work as expected when the subquery contains NULL. If you still wanna use it, you need to add a WHERE clause to exclude NULL from the subquery.


/*
New Companies
Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy:

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:

    The tables may contain duplicate records.
    The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
*/
SELECT c.company_code, 
       c.founder, 
       COUNT(DISTINCT(lm.lead_manager_code)),
       COUNT(DISTINCT(sm.senior_manager_code)),
       COUNT(DISTINCT(m.manager_code)),
       COUNT(DISTINCT(e.employee_code))
FROM company c
    JOIN lead_manager lm ON c.company_code = lm.company_code
    JOIN senior_manager sm ON c.company_code = sm.company_code
    JOIN manager m ON c.company_code = m.company_code
    JOIN employee e ON c.company_code = e.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code ASC;
-- 在 SELECT 指定的字段要么包含在 GROUP BY 中，作为分组依据；要么就要被包含在 aggregate functions 中


/*
Weather Observation Station 20
A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places. 
*/
with tbl as
(
    select lat_n,
    row_number() over(order by lat_n asc) as lat_asc,
    row_number() over(order by lat_n desc) as lat_desc
    from station
)

select round(avg(lat_n),4) from tbl
where lat_asc in (lat_desc , lat_desc+1, lat_desc-1 )
-- Only Oracle has "MEDIAN" as a built-in function.


/*
The Report
You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
Grades contains the following data:
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.
Write a query to help Eve.
*/
-- Solution 1
(SELECT name, grade, marks FROM students s
    JOIN grades g ON s.marks BETWEEN g.min_mark AND g.max_mark
WHERE grade >= 8)
UNION
(SELECT "NULL", grade, marks FROM students s
    JOIN grades g ON s.marks BETWEEN g.min_mark AND g.max_mark
WHERE grade < 8)
ORDER BY grade DESC, name, marks;
-- When you include an ORDER BY clause, it must follow the final SELECT statement

-- Solution 2
SELECT IF(GRADE < 8, NULL, NAME), GRADE, MARKS
FROM STUDENTS JOIN GRADES
WHERE MARKS BETWEEN MIN_MARK AND MAX_MARK
ORDER BY GRADE DESC, NAME


/*
Top Competitors
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.
*/


/*
Ollivander's Inventory
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.
*/
SELECT id, age, coins_needed, power FROM wands w
    JOIN wands_property wp ON w.code = wp.code
WHERE is_evil = 0 AND coins_needed = 
    (SELECT MIN(coins_needed) FROM wands w1
        JOIN wands_property AS wp1 ON w1.code = wp1.code
     WHERE w1.power = w.power AND wp1.age = wp.age)
ORDER BY power DESC, age DESC;


/*
Challenges
Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
*/
WITH data
AS
(
SELECT c.hacker_id as id, h.name as name, count(c.hacker_id) as counter
FROM Hackers h
JOIN Challenges c on c.hacker_id = h.hacker_id
GROUP BY c.hacker_id, h.name
)
SELECT id,name,counter
FROM data
WHERE
counter=(SELECT max(counter) FROM data) /*select user that has max count submission*/
OR
counter in (SELECT counter FROM data
GROUP BY counter
HAVING count(counter)=1 ) /*filter out the submission count which is unique*/
ORDER BY counter desc, id





















/*
Occupations
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
Note: Print NULL when there are no more names corresponding to an occupation.
*/
