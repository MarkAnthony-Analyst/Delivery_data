
--Total Amount and TOtal number Of Orders Per Region
SELECT Delivery_Region, SUM(order_total) AS 'Total Amount', COUNT(Customer_placed_order_time) AS 'Number of orders'
FROM dbo.deliveries
WHERE Delivery_Region != 'None'
GROUP BY Delivery_Region
ORDER BY 2 DESC;

--Average order amount and number of restaurant per region
SELECT Delivery_Region, COUNT(DISTINCT Restaurant_ID) AS Number_of_Restaurants,  AVG(Order_Total) AS Average_order_amount
FROM dbo.deliveries
WHERE Delivery_Region != 'None'
GROUP BY Delivery_Region
ORDER BY 3 DESC ;

--Average amount daily total customer spend
SELECT distinct restaurant_id, SUM(Order_Total)/31 AS Average_order_amount
FROM dbo.deliveries
WHERE Delivery_Region != 'none'
GROUP BY  restaurant_id
ORDER BY 2 desc  ;

--average daily orders
SELECT day_of_the_month, 
AVG(COUNT(Driver_ID)) OVER (PARTITION BY day_of_the_month) AS Daily_Count_Of_Orders
FROM dbo.deliveries
WHERE Delivery_Region != 'none'
GROUP BY  day_of_the_month
ORDER BY 1  ;


