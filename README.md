# Airbnb New York City – Market Analysis Dashboard

This project aims to uncover actionable insights from Airbnb listings across New York City to support data-driven decisions for both Airbnb stakeholders and the public. Using data from [Inside Airbnb](https://insideairbnb.com/new-york-city/), the analysis highlights key trends in pricing, availability, listing distribution, and room types across boroughs.

## Business Objective

Help Airbnb better understand listing distribution and availability across NYC in order to:
- Identify underserved markets with growth potential.
- Assist stakeholders in optimizing supply and pricing.
- Provide the public with transparency on room types and availability in various boroughs.

## Target Audience

- Airbnb internal teams (e.g., Strategy, Marketing, Product)
- Stakeholders interested in NYC market performance
- Local policymakers and housing regulators
- Travelers or renters looking for Airbnb insights

## Dataset

- Source: [Inside Airbnb – NYC](https://insideairbnb.com/new-york-city/)
- Includes listing information such as price, room type, borough, availability, and reviews

## Tools Used

- **SQL Server Management Studio (SSMS)** – Data cleaning, EDA, and transformations
- **Excel** – Export intermediary datasets
- **Tableau** – Interactive dashboard creation and data visualization

## Analysis Workflow

1. **Data Acquisition**  
   - Downloaded Airbnb NYC dataset from Inside Airbnb.

2. **Data Cleaning in SQL**  
   - Removed null/irrelevant rows and extreme outliers  
   - Filtered for relevant date ranges and property types  
   - Applied logic to estimate booking activity (nights × price)

3. **Exploratory Data Analysis (EDA)**  
   - Room Type Distribution  
   - Listings by Neighbourhood Group  
   - Average Price per Borough  
   - Average Availability per Borough

4. **Dashboard Development**  
   - Selected 4 key metrics for visualization  
   - Built a dashboard in Tableau with interactive filters

   [View the Tableau Dashboard](https://public.tableau.com/views/AirbnbNewYork_17523314919030/Dashboard1)

## Estimated Business Impact

Using the data provided:

Average nights booked: 48 nights/year

Average price/night: $308

Average income per listing: $9,003

- **Opportunity:** A 10–20% increase in occupancy in high-availability regions could result in an additional **$900–$1,800** income per listing.  
- Scaling this across thousands of listings can unlock **millions in revenue uplift** and reduce over-reliance on saturated areas like Manhattan.

## Future Recommendations

- Expand analysis to include review sentiment, stay duration trends, or seasonal patterns.
- Incorporate regulatory compliance metrics to assess risk exposure.
- Enable real-time monitoring using automated dashboards or alerts.
