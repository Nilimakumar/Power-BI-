select * from [Hotel Reservation Dataset]
SELECT DISTINCT room_type_reserved FROM [Hotel Reservation Dataset]
SELECT DISTINCT type_of_meal_plan FROM [Hotel Reservation Dataset]
SELECT booking_status
FROM [Hotel Reservation Dataset]
WHERE booking_status = 'Not_Canceled'
Select no_of_children
FROM [Hotel Reservation Dataset]
WHERE no_of_adults = 0
SELECT room_type_reserved
FROM  [Hotel Reservation Dataset]
ORDER BY market_segment_type DESC;
SELECT avg_price_per_room, market_segment_type
FROM  [Hotel Reservation Dataset]
ORDER BY booking_status DESC;
SELECT COUNT(booking_status)
FROM [Hotel Reservation Dataset]
WHERE  booking_status = 'Not_Canceled'

SELECT COUNT(Booking_ID)  /*What is the total number of reservations in the dataset?*/
FROM [Hotel Reservation Dataset]

SELECT COUNT(DISTINCT type_of_meal_plan)
FROM [Hotel Reservation Dataset];
SELECT MAX(type_of_meal_plan)
FROM [Hotel Reservation Dataset]

SELECT MIN(type_of_meal_plan)
FROM [Hotel Reservation Dataset]

SELECT COUNT(type_of_meal_plan)
FROM [Hotel Reservation Dataset]
WHERE  type_of_meal_plan = 'Not Selected'

SELECT COUNT(type_of_meal_plan)
FROM [Hotel Reservation Dataset]
WHERE  type_of_meal_plan = 'Meal Plan 1'

SELECT MAX(type_of_meal_plan)
FROM [Hotel Reservation Dataset]
WHERE  type_of_meal_plan = 'Meal Plan 1';

SELECT COUNT(type_of_meal_plan)
FROM [Hotel Reservation Dataset]
WHERE  type_of_meal_plan = 'Meal Plan 2'

SELECT type_of_meal_plan, COUNT(Booking_ID) AS Total_Reservations
FROM [Hotel Reservation Dataset]
GROUP BY type_of_meal_plan
ORDER BY Total_Reservations DESC  /*Which meal plan is the most popular among guests?*/

SELECT AVG(avg_price_per_room) AS Average_Price_Per_Room_With_Children
FROM [Hotel Reservation Dataset]
WHERE no_of_children > 0; /*What is the average price per room for reservations involving children?*/

SELECT COUNT(Booking_ID) AS Total_Reservations
FROM [Hotel Reservation Dataset]
WHERE YEAR(arrival_date) = '2018'; /*How many reservations were made for the year 20XX (replace XX with the desired year)?*/

SELECT room_type_reserved, COUNT(Booking_ID) AS Total_Reservations
FROM [Hotel Reservation Dataset]
GROUP BY room_type_reserved
ORDER BY Total_Reservations DESC /*What is the most commonly booked room type?*/

SELECT COUNT(Booking_ID) AS Weekend_Reservations
FROM [Hotel Reservation Dataset]
WHERE no_of_weekend_nights > 0; /*How many reservations fall on a weekend (no_of_weekend_nights > 0)?*/

SELECT 
    MAX(lead_time) AS Highest_Lead_Time,
    MIN(lead_time) AS Lowest_Lead_Time
FROM [Hotel Reservation Dataset]; /*What is the highest and lowest lead time for reservations?*/

SELECT market_segment_type, COUNT(Booking_ID) AS Total_Reservations
FROM [Hotel Reservation Dataset]
GROUP BY market_segment_type
ORDER BY Total_Reservations DESC; /*What is the most common market segment type for reservations?*/


SELECT COUNT(Booking_ID) AS Confirmed_Reservations
FROM [Hotel Reservation Dataset]
WHERE booking_status = 'Confirmed';

SELECT COUNT(Booking_ID) AS Confirmed_Reservations
FROM [Hotel Reservation Dataset]
WHERE booking_status = 'Not_Canceled'; /*How many reservations have a booking status of "Confirmed"?*/


SELECT COUNT(booking_status) AS Confirmed_Reservations
FROM [Hotel Reservation Dataset]
WHERE booking_status = 'Not_Canceled';

SELECT 
    SUM(no_of_adults) AS Total_Adults,
    SUM(no_of_children) AS Total_Children
FROM [Hotel Reservation Dataset]; /*What is the total number of adults and children across all reservations?*/

SELECT AVG(no_of_weekend_nights) AS Avg_Weekend_Nights_With_Children
FROM [Hotel Reservation Dataset]
WHERE no_of_children > 0; /*What is the total number of adults and children across all reservations?*/


SELECT 
    MONTH(arrival_date) AS Reservation_Month,
    COUNT(Booking_ID) AS Total_Reservations
FROM [Hotel Reservation Dataset]
GROUP BY MONTH(arrival_date)
ORDER BY Reservation_Month; /*How many reservations were made in each month of the year?*/


SELECT 
    room_type_reserved,
    AVG(no_of_weekend_nights + no_of_week_nights) AS Avg_Total_Nights
FROM [Hotel Reservation Dataset]
GROUP BY room_type_reserved; /*What is the average number of nights (both weekend and weekday) spent by guests for each room
type?*/

WITH Children_Reservations AS (
    SELECT *
    FROM [Hotel Reservation Dataset]
    WHERE no_of_children > 0
)

SELECT 
    room_type_reserved AS Most_Common_Room_Type,
    AVG(avg_price_per_room) AS Average_Price_For_Most_Common_Room_Type
FROM Children_Reservations
GROUP BY room_type_reserved
ORDER BY COUNT(Booking_ID) DESC  /*For reservations involving children, what is the most common room type, and what is the average
price for that room type?*/

SELECT 
    market_segment_type,
    AVG(avg_price_per_room) AS Average_Price_Per_Room
FROM [Hotel Reservation Dataset]
GROUP BY market_segment_type
ORDER BY Average_Price_Per_Room DESC  /*Find the market segment type that generates the highest average price per room.*/
