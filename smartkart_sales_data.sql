select * from smartkart_full_sales_data;
-- Get total sales for each product category.
select Category, round(sum(sales),2) as Total_sale from smartkart_full_sales_data group by Category; 

-- Find the total number of orders.
select count(distinct Order_ID) as total_order from smartkart_full_sales_data;

-- List all unique products sold.
select distinct Product_Name from smartkart_full_sales_data ; 

-- Get sales and profit for each region.
SELECT 
    region,
    round(SUM(Sales),2) AS Total_Sale,
    round(SUM(Profit),2) AS Total_Profit
FROM
    smartkart_full_sales_data 
    group by region;
    
    -- Show orders where loss occurred.
    select * from smartkart_full_sales_data where Profit<0;
    
    -- Top 5 products by total sales.
    select Product_Name , round(sum(Sales),1) as Total_sales from smartkart_full_sales_data
    group by Product_Name
    order by Total_sales desc limit 5;

-- Total profit per customer.
SELECT 
    Customer_ID, ROUND(SUM(Profit), 1) AS Total_Profit
FROM
    smartkart_full_sales_data
WHERE
    Profit > 0 
GROUP BY Customer_ID ;

-- Find customers with more than 5 orders and total sales over ₹50,000.
SELECT 
    Customer_ID,
    COUNT(Order_ID) AS Total_Order,
    ROUND(SUM(Sales)) AS Total_sales
FROM
    smartkart_full_sales_data
GROUP BY Customer_ID
HAVING Total_Order > 5 AND Total_sales > 50000;

-- Get the region with the highest average profit per order.
SELECT 
    Region, ROUND(AVG(Profit), 2) AS avg_profit
FROM
    smartkart_full_sales_data
WHERE
    Profit > 0
GROUP BY Region
ORDER BY avg_profit DESC;

-- Create a column that separates Profit and Loss.

SELECT 
    *,
    CASE
        WHEN Profit > 0 THEN Profit
        ELSE 0
    END AS Clean_Profit,
    CASE
        WHEN Profit < 0 THEN ABS(Profit)
        ELSE 0
    END AS Clean_Loss
FROM
    smartkart_full_sales_data;
    
    