

-- Clean Data and EDA



-- Selected Columns to Use:

SELECT 
id, 
name, 
host_id, 
host_name, 
neighbourhood_group_cleansed, 
neighbourhood, 
latitude, 
longitude, 
room_type, 
price, 
minimum_nights, 
number_of_reviews, 
last_review, 
reviews_per_month, 
calculated_host_listings_count, 
availability_365, 
number_of_reviews_ltm, 
license
FROM [Airbnb].[dbo].[listings]


-- Drop old cleaned table if exists

IF OBJECT_ID('listings_cleaned') IS NOT NULL
    DROP TABLE listings_cleaned;


-- Create base cleaned version

SELECT DISTINCT
    id, 
    name, 
    host_id, 
    host_name, 
    neighbourhood_group_cleansed, 
    neighbourhood, 
    latitude, 
    longitude, 
    room_type, 
    price, 
    minimum_nights, 
    number_of_reviews, 
    last_review, 
    reviews_per_month, 
    calculated_host_listings_count, 
    availability_365, 
    number_of_reviews_ltm, 
    license
INTO listings_cleaned
FROM [Airbnb].[dbo].[listings];


-- Remove rows with critical nulls

DELETE FROM listings_cleaned
WHERE 
    id IS NULL OR
    price IS NULL OR
    room_type IS NULL OR
    latitude IS NULL OR
    longitude IS NULL OR
	neighbourhood IS NULL OR
    neighbourhood_group_cleansed IS NULL;


-- Filter out invalid or extreme values

DELETE FROM listings_cleaned
WHERE 
    price <= 0 OR price > 5000 -- outliers or wrong input
    OR minimum_nights <= 0 OR minimum_nights > 365
    OR number_of_reviews < 0
    OR reviews_per_month < 0
    OR availability_365 < 0 OR availability_365 > 365
    OR latitude NOT BETWEEN -90 AND 90
    OR longitude NOT BETWEEN -180 AND 180;


-- Fill or drop remaining missing values

UPDATE listings_cleaned
SET reviews_per_month = 0
WHERE reviews_per_month IS NULL;

UPDATE listings_cleaned
SET last_review = NULL
WHERE last_review = '';





-- EDA (Exploratory Data Analysis)



-- Room Type Distribution

SELECT room_type, COUNT(*) AS total_listings
FROM [Airbnb].[dbo].[listings]
GROUP BY room_type
ORDER BY total_listings DESC;


-- Listings by Neighbourhood Group

SELECT neighbourhood_group_cleansed, COUNT(*) AS total_listings
FROM [Airbnb].[dbo].[listings]
GROUP BY neighbourhood_group_cleansed
ORDER BY total_listings DESC;


-- Average price by room type

SELECT room_type, ROUND(avg(price), 2) AS avg_price
FROM [Airbnb].[dbo].[listings]
GROUP BY room_type
ORDER BY avg_price DESC;


-- Average Price by Borough

SELECT neighbourhood_group_cleansed, ROUND(AVG(Price), 2) AS average_price
FROM [Airbnb].[dbo].[listings]
GROUP BY neighbourhood_group_cleansed
ORDER BY average_Price DESC;


-- Average Availability per Borough

SELECT neighbourhood_group_cleansed, ROUND(AVG(availability_365), 1) AS average_availability
FROM [Airbnb].[dbo].[listings]
GROUP BY neighbourhood_group_cleansed
ORDER BY average_availability DESC;






