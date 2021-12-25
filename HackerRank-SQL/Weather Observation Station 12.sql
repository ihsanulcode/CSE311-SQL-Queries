/*
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY NOT REGEXP '^[AEIOU]' AND CITY NOT REGEXP '[AEIOU]$';

/*
^ MEANS BEGINNING OF THE STRING 
& MEANS END OF STRING
*/