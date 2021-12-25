/*
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
*/

/*
SELECT DISTINCT CITY FROM STATION 
WHERE CITY REGEXP '^[^aeiou]|[^aeiou]$';
*/

/*
SELECT DISTINCT CITY FROM STATION WHERE CITY NOT REGEXP '^[AEIOU]' OR CITY NOT REGEXP '[AEIOU]$';
*/

SELECT DISTINCT CITY FROM STATION 
WHERE RIGHT(LOWER(CITY),1) NOT IN ('a','e','i','o','u') 
OR 
LEFT(LOWER(CITY),1) NOT IN ('a','e','i','o','u')