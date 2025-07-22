CREATE DATABASE accident_data;
USE accident_data;

-- total state-wise accidents
SELECT 
    Year,
    State,
    SUM(`State Accident`) AS Total_State_Accidents
FROM 
    finalproject2
WHERE 
    Year BETWEEN 2015 AND 2022
GROUP BY 
    Year, State
ORDER BY 
    Year, Total_State_Accidents DESC;

-- top 5 states with the highest accidents across all years
SELECT 
    State,
    SUM(`State Accident`) AS Total_Accidents_All_Years
FROM 
    finalproject2
GROUP BY 
    State
ORDER BY 
    Total_Accidents_All_Years DESC
LIMIT 5;

-- total city-wise accidents
SELECT 
    Year,
    City,
    SUM(`City Accident`) AS Total_City_Accidents
FROM 
    finalproject2
WHERE 
    Year BETWEEN 2015 AND 2022
GROUP BY 
    Year, City
ORDER BY 
    Year, Total_City_Accidents DESC;

-- top 5 cities with the highest accidents across all years
SELECT 
    City,
    SUM(`City Accident`) AS Total_Accidents_All_Years
FROM 
    finalproject2
GROUP BY 
    City
ORDER BY 
    Total_Accidents_All_Years DESC
LIMIT 5;

-- total number of accidents per year from 2015 to 2022
SELECT 
    Year, 
    SUM(`Total Accidents`) AS Total_Accidents
FROM 
    finalproject2
WHERE 
    Year BETWEEN 2015 AND 2022
GROUP BY 
    Year
ORDER BY 
    Year;

-- yearly state-wise accidents by different causes
SELECT
  `Year`,
  `State`,
  SUM(`Drunken Driving`) AS Drunken_Driving_Accidents,
  SUM(`Mobile Usage`) AS Mobile_Usage_Accidents,
  SUM(`Traffic Signal`) AS Traffic_Signal_Accidents,
  SUM(`Wrong Side`) AS Wrong_Side_Accidents
FROM
  finalproject2
GROUP BY
  `Year`, `State`
ORDER BY
  `Year`, `State`;

-- top 5 states with highest number of accidents with their cause.
SELECT
  `State`,
  SUM(`Drunken Driving`) AS Drunken_Driving_Accidents,
  SUM(`Mobile Usage`) AS Mobile_Usage_Accidents,
  SUM(`Traffic Signal`) AS Traffic_Signal_Accidents,
  SUM(`Wrong Side`) AS Wrong_Side_Accidents,
  (
    SUM(`Drunken Driving`) +
    SUM(`Mobile Usage`) +
    SUM(`Traffic Signal`) +
    SUM(`Wrong Side`)
  ) AS Total_Accidents
FROM
  finalproject2
GROUP BY
  `State`
ORDER BY
  Total_Accidents DESC
LIMIT 5;
