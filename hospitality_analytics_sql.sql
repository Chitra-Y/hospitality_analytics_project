create database hospitality_db;
use hospitality_db;

CREATE TABLE hospitality_data (
    Booking_ID VARCHAR(10),
    Booking_Date DATE,
    Check_In DATE,
    Check_Out DATE,
    Hotel_Name VARCHAR(50),
    City VARCHAR(50),
    Room_Type VARCHAR(20),
    Customer_Type VARCHAR(20),
    Booking_Channel VARCHAR(30),
    Room_Rate INT,
    Nights INT,
    Revenue INT,
    Occupancy_Status VARCHAR(20),
    Rating INT,
    Cancellation VARCHAR(10)
);

select count(*) from hospitality_data;
select *  from hospitality_data
limit 10;

-- Total revenue by hotel --
select hotel_name,
sum(revenue) AS  total_revenue
from hospitality_data
group by hotel_name
order by total_revenue DESC;
-- Revenue by city--
select city,
SUM(revenue) AS total_revenue
from hospitality_data
group by city;
-- monthly revenue --
select month(booking_date) as month_no,
SUM(revenue) as revenue
from hospitality_data
group by month(booking_date);
-- top rated hotels --
select hotel_name,
avg(rating) as avg_rating
from hospitality_data
group by hotel_name
order by avg_rating DESC;
-- booking channel performance --
select booking_channel,
count(*) bookings,
sum(revenue) as revenue
from hospitality_data
group by booking_channel;
-- cancellation analysis --
select city,
count(*) cancellations
from hospitality_data 
where cancellation='yes'
group by city;
-- room type analysis --
select room_type,
count(*) bookings,
sum(revenue) revenue
from hospitality_data
group by room_type;

select count(*) as total_bookings
from hospitality_data;

select * from hospitality_data;
-- occupancy rate --
select round(
     sum(case when occupancy_status ='occupied' then 1 else 0 end)* 100.0/ count(*),2) as occupancy_rate
     from hospitality_data;
     -- cancellation rate --
SELECT ROUND(
    SUM(CASE WHEN cancellation = 'Yes' THEN 1 ELSE 0 END) * 100.0
    / COUNT(*), 2
) AS cancellation_rate
FROM hospitality_data;






