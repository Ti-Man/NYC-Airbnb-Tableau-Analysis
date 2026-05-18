-- Query 1: Overall portfolio summary by room type
-- Total listings, avg nightly price, avg availability, avg reviews

SELECT
    room_type,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS avg_nightly_price,
    ROUND(AVG(availability_365), 1) AS avg_availability_days,
    ROUND(AVG(number_of_reviews), 1) AS avg_reviews
FROM airbnb_listings
GROUP BY room_type
ORDER BY total_listings DESC;

-- Query 2: Top 10 neighbourhoods by average nightly price
-- Minimum 10 listings filter removes statistical outliers

SELECT
    neighbourhood,
    neighbourhood_group,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS avg_nightly_price,
    ROUND(MIN(price), 2) AS min_price,
    ROUND(MAX(price), 2) AS max_price
FROM airbnb_listings
GROUP BY neighbourhood
HAVING COUNT(*) >= 10
ORDER BY avg_nightly_price DESC
LIMIT 10;

-- Query 3: Occupancy rate proxy by borough
-- Standard InsideAirbnb formula: (365 - avg availability) / 365

SELECT
    neighbourhood_group AS borough,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(availability_365), 1) AS avg_availability_days,
    ROUND((365 - AVG(availability_365)) / 365 * 100, 1) AS occupancy_rate_pct
FROM airbnb_listings
GROUP BY neighbourhood_group
ORDER BY occupancy_rate_pct DESC;

-- Query 4: Price tier segmentation using CASE WHEN
-- Mirrors the grade-based segmentation logic from LendingClub project

SELECT
    price_tier,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(number_of_reviews), 1) AS avg_reviews,
    ROUND(AVG(availability_365), 1) AS avg_availability_days
FROM (
    SELECT *,
        CASE
            WHEN price < 50 THEN '1 - Budget (Under $50)'
            WHEN price BETWEEN 50 AND 149 THEN '2 - Mid-Range ($50-$149)'
            WHEN price BETWEEN 150 AND 299 THEN '3 - Premium ($150-$299)'
            ELSE '4 - Luxury ($300+)'
        END AS price_tier
    FROM airbnb_listings
    WHERE price > 0
) AS tiered
GROUP BY price_tier
ORDER BY price_tier;

-- Query 5: Host portfolio size distribution
-- Identifies single-listing hosts vs multi-property operators

SELECT
    CASE
        WHEN listing_count = 1 THEN '1 - Single Listing'
        WHEN listing_count BETWEEN 2 AND 5 THEN '2 - Small Portfolio (2-5)'
        WHEN listing_count BETWEEN 6 AND 10 THEN '3 - Medium Portfolio (6-10)'
        ELSE '4 - Large Portfolio (10+)'
    END AS host_type,
    COUNT(*) AS total_hosts,
    ROUND(AVG(listing_count), 1) AS avg_listings_per_host
FROM (
    SELECT host_id, COUNT(*) AS listing_count
    FROM airbnb_listings
    GROUP BY host_id
) AS host_counts
GROUP BY host_type
ORDER BY host_type;
