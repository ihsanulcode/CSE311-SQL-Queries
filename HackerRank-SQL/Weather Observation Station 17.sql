/*
Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to  decimal places.
*/

SELECT ROUND(LONG_W,4) 
FROM STATION 
WHERE LAT_N = (SELECT MIN(LAT_N) from STATION where LAT_N > 38.7780);