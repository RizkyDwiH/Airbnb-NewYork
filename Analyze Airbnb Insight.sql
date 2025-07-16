

-- Analyze Based on Airbnb Insight Focus



-- Top hosts by listing count:

SELECT host_id, host_name, COUNT(*) AS listings_count
FROM [Airbnb].[dbo].[listings]
GROUP BY host_id, host_name
HAVING COUNT(*) > 1
ORDER BY listings_count DESC;


-- Listings with 0 reviews and low availability:

SELECT id, name, number_of_reviews, availability_365, reviews_per_month
FROM [Airbnb].[dbo].[listings]
WHERE number_of_reviews = 0 AND reviews_per_month = 0 AND availability_365 < 30; 30;


-- Most active neighborhoods (recent listings):

SELECT neighbourhood, COUNT(*) AS listings_count
FROM [Airbnb].[dbo].[listings]
WHERE last_review >= DATEADD(month, -6, GETDATE())
GROUP BY neighbourhood
ORDER BY listings_count DESC;


-- Supply: Number of Listings by Area

SELECT neighbourhood_group_cleansed, COUNT(*) AS total_listings
FROM [Airbnb].[dbo].[listings]
GROUP BY neighbourhood_group_cleansed
ORDER BY total_listings DESC;


-- Pricing Strategy: Avg. Price per Room Type and Area

SELECT neighbourhood_group_cleansed, room_type, AVG(price) AS avg_price
FROM [Airbnb].[dbo].[listings]
GROUP BY neighbourhood_group_cleansed, room_type
ORDER BY neighbourhood_group_cleansed, avg_price DESC;


-- Availability Insights

SELECT neighbourhood_group_cleansed, AVG(availability_365) AS avg_availability
FROM [Airbnb].[dbo].[listings]
GROUP BY neighbourhood_group_cleansed
ORDER BY avg_availability DESC;




