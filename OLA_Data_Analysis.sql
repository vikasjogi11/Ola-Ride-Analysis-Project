CREATE TABLE bengaluru_ride_booking (
    date DATE,
    time TIME,
    booking_id VARCHAR(20) PRIMARY KEY,
    booking_status VARCHAR(30),
    customer_id VARCHAR(20),
    vehicle_type VARCHAR(20),
    pickup_location VARCHAR(50),
    drop_location VARCHAR(50),
    avg_vtat_min NUMERIC(5,2),
    avg_ctat_min NUMERIC(5,2),
    cancelled_rides_by_customer INTEGER,
    reason_for_cancelling_by_customer TEXT,
    cancelled_rides_by_driver INTEGER,
    reason_for_cancelling_by_driver TEXT,
    incomplete_rides INTEGER,
    reason_for_incomplete_rides TEXT,
    booking_value NUMERIC(10,2),
    ride_distance NUMERIC(5,2),
    driver_ratings NUMERIC(2,1),
    customer_ratings NUMERIC(2,1)
);



SELECT * from bengaluru_ride_booking;



/* reterive all sucessfull booking */
CREATE VIEW Successful_Booking AS
Select * from bengaluru_ride_booking
Where booking_status='Success';

SELECT * FROM Successful_Booking;

/* 2) find the AVG ride distance for each vehicle type */
CREATE VIEW avg_ride_distance_for_each_vehicle as 
SELECT  vehicle_type, AVG(ride_distance)  as avg_distance from  bengaluru_ride_booking
group by vehicle_type;

SELECT * FROM avg_ride_distance_for_each_vehicle;


/* 3) Get the total number of cancel ride by the customer*/
CREATE VIEW Cancel_ride_by_customer as 
SELECT COUNT(*) from bengaluru_ride_booking
where cancelled_rides_by_customer='1';

SELECT * FROM Cancel_ride_by_customer;



/* List top 5 customer who booked the highest number of ride */
CREATE VIEW TOP_5_customer as 
SELECT customer_id, COUNT(booking_id) as total_rides FROM  bengaluru_ride_booking GROUP BY
customer_id ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM TOP_5_customer;



/* get the number of ride cancel by driver  due to personal and car related issue */
CREATE VIEW ride_cancel_by_driver_PCI_issue as 
Select count(reason_for_cancelling_by_driver) from bengaluru_ride_booking 
where reason_for_cancelling_by_driver='Personal & Car related issues';

select * from ride_cancel_by_driver_PCI_issue;

/* find the max and min driver rating for prime sedan bookings */
CREATE VIEW Driver_rating_for_prime_sedan as 
SELECT MAX(driver_ratings) as MAX_rating,
MIN(driver_ratings) as MIN_rating from bengaluru_ride_booking  WHERE vehicle_type='Prime Sedan';


Select * from Driver_rating_for_prime_sedan;


/* find the average customer rating per vehicle type  */
CREATE VIEW avg_cust_rating as 
SELECT vehicle_type, AVG(customer_ratings) as avg_customer_rating FROM bengaluru_ride_booking
GROUP BY vehicle_type;

Select * from avg_cust_rating;


/* calculate the total booking value of ride complete successfully */
CREATE VIEW total_successful_ride_value as 
 SELECT SUM(booking_value) as total_successful_value FROM bengaluru_ride_booking WHERE
booking_status = 'Success';
select * from total_successful_ride_value


/* list all incomplete ride along with reason */
CREATE VIEW incomplete_ride_along_reason as 
SELECT booking_id, reason_for_incomplete_rides FROM bengaluru_ride_booking WHERE incomplete_rides =1;

select * from incomplete_ride_along_reason;



/* reterive all sucessfull booking */
SELECT * FROM Successful_Booking;


/* 2) find the AVG ride distance for each vehicle type */
SELECT * FROM avg_ride_distance_for_each_vehicle;

/* 3) Get the total number of cancel ride by the customer*/
SELECT * FROM Cancel_ride_by_customer;


/* 4) List top 5 customer who booked the highest number of ride */
SELECT * FROM TOP_5_customer;

/* 5) get the number of ride cancel by driver  due to personal and car related issue */
select * from ride_cancel_by_driver_PCI_issue;

/* 6) find the max and min driver rating for prime sedan bookings */
Select * from Driver_rating_for_prime_sedan;

/* 7) find the average customer rating per vehicle type  */
Select * from avg_cust_rating;

/* 8) calculate the total booking value of ride complete successfully */
select * from total_successful_ride_value

/* 9) list all incomplete ride along with reason */
select * from incomplete_ride_along_reason;
