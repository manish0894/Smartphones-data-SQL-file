CREATE DATABASE campusx;

SHOW DATABASES;
USE campusx;

SELECT * FROM smartphones;

--  sorting questions

-- top 5 samsung phones with biggest screen size
SELECT model, screen_size FROM smartphones WHERE brand_name = 'samsung' ORDER BY screen_size DESC LIMIT 5;

-- sort all phones with in descending order of number total cameras
SELECT model, (num_rear_cameras + num_front_cameras) as total_cameras FROM smartphones ORDER BY total_cameras DESC;

-- sort data on the basis of ppi in decreasing order
SELECT model, SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size AS PPI FROM smartphones ORDER BY PPI DESC;

-- find the phone with 2nd largest battery
SELECT model, battery_capacity FROM smartphones ORDER BY battery_capacity DESC LIMIT 1,1;

-- find the name and rating of worst rated apple phone
SELECT model, rating FROM smartphones WHERE brand_name = 'apple' ORDER BY rating ASC LIMIT 1;

-- group by questions

-- group smartphones by brand and get the count, avg price, max rating, avg scree size, and avg battery capacity and count of phones
SELECT brand_name, count(*) as num_phones, avg(price) as Avg_Price, max(rating) as Max_Rating, avg(screen_size) as Avg_Screen_Size, avg(battery_capacity) as Avg_Batter_Capacity FROM smartphones GROUP BY brand_name ORDER BY num_phones DESC;

-- group smartphones by whether they have an NFC and get the average price and rating
SELECT has_nfc, avg(price) as 'Avg_Price', avg(rating) as 'Avg_Rating' FROM smartphones GROUP BY has_nfc;

-- group smartphones by the extended memory available and the get the avg price
SELECT extended_memory_available, avg(price) as 'Avg_Price' FROM smartphones GROUP BY extended_memory_available;

-- group smartphones by the processor brand and the count of models and the avg primary camera resolution
SELECT brand_name, processor_brand, count(*) as 'num_of_phones', avg(primary_camera_front) as 'Avg_Rear_Camera' FROM smartphones GROUP BY brand_name, processor_brand;

-- find top 5 most costly phone brands
SELECT brand_name, avg(price) as 'Price' FROM smartphones GROUP BY brand_name ORDER BY price DESC LIMIT 5;

-- which brand makes the smallest screen smartphones
SELECT brand_name , min(screen_size) as Min_Screen_Size FROM smartphones GROUP BY brand_name ORDER BY Min_Screen_Size ASC LIMIT 1;

-- group smartphones by the brand and find the brand which has highest number of models that have both NFC and an IR Blaster
SELECT brand_name, count(*) as 'Count' FROM smartphones where (has_nfc = 'True' and has_ir_blaster = 'True') GROUP BY brand_name ORDER BY Count DESC;

-- find all samsung 5g enabled smartphones and find out the avg price for NFC and Non-NFC phones
SELECT has_nfc, avg(price) as 'Avg_Price' FROM smartphones where brand_name ='samsung' GROUP BY has_nfc;


-- having clause questions

-- find the avg rating smartphone brands which have more than 20 phones
SELECT brand_name, count(*) as Num_of_phones, avg(rating) as 'Avg_Rating' FROM smartphones GROUP BY brand_name HAVING Num_of_phones > 20 ORDER BY Avg_Rating DESC;

-- find the top 3 brands with highest avg ram that have a refresh rate of atleast 90 Hz and fast charging available and dont consider brands which have less than 10 phones
SELECT brand_name, Count(*) as Num_of_phones, avg(ram_capacity) as Avg_Ram FROM smartphones WHERE (refresh_rate >= 90 and fast_charging_available) GROUP BY brand_name HAVING Num_of_phones > 10 ORDER BY Avg_Ram DESC LIMIT 3;

-- find the avg price of all the phone brands with avg rating > 70 and number of phones more than 10 among all 5g enabled phones
SELECT brand_name, count(*) as Num_of_phones, avg(price) as 'Avg_Price' FROM smartphones WHERE has_5g = 'True' GROUP BY brand_name HAVING (Num_of_phones > 10 AND avg(rating) > 70);

