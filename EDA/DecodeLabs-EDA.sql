CREATE TABLE Orders (
    OrderID VARCHAR(50),
    Date TIMESTAMP,
    CustomerID VARCHAR(50),
    Product VARCHAR(255),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    ShippingAddress TEXT,
    PaymentMethod VARCHAR(50),
    OrderStatus VARCHAR(50),
    TrackingNumber VARCHAR(100),
    ItemsInCart INT,
    CouponCode VARCHAR(50),
    ReferralSource VARCHAR(100),
    TotalPrice DECIMAL(12,2)
);

SELECT * FROM Orders ;

SELECT
	OrderStatus,
	COUNT(*) AS total_orders
FROM Orders
GROUP BY OrderStatus;

WITH pipline AS (
SELECT 
		COUNT(*) AS total_orders,
		COUNT(CASE WHEN orderstatus = 'Delivered' THEN 1 END) AS delivered_count,
		COUNT(CASE WHEN orderstatus = 'Shipped' THEN 1 END) AS Shipped_count,
		COUNT(CASE WHEN orderstatus = 'Returned' THEN 1 END) AS Returned_count,
		COUNT(CASE WHEN orderstatus = 'Cancelled' THEN 1 END) AS Cancelled_count,
		COUNT(CASE WHEN orderstatus = 'Pending' THEN 1 END) AS Pending_count
FROM Orders	
)

SELECT
	ROUND((delivered_count::DECIMAL/total_orders::DECIMAL)*100,2) AS delivered_rate,
	ROUND((Shipped_count::DECIMAL/total_orders::DECIMAL)*100,2) AS Shipped_rate,
	ROUND((Returned_count::DECIMAL/total_orders::DECIMAL)*100,2) AS Returned_rate,
	ROUND((Cancelled_count::DECIMAL/total_orders::DECIMAL)*100,2) AS Cancelled_rate,
	ROUND((Pending_count::DECIMAL/total_orders::DECIMAL)*100,2) AS Pending_rate
FROM pipline;

SELECT
	CustomerID,
	COUNT(*) AS total_order_placed
FROM Orders
GROUP BY CustomerID
ORDER BY total_order_placed DESC;

SELECT
	ReferralSource,
	COUNT(ReferralSource) AS ref_Source,
	SUM(TotalPrice) AS revenue
FROM Orders
GROUP BY ReferralSource
ORDER BY ref_Source DESC,revenue 

SELECT
	AVG(TotalPrice) AS avg_price,
	MIN(TotalPrice),
	MAX(TotalPrice)
FROM Orders;

WITH categorized_orders AS (
    SELECT
        OrderID,
        TotalPrice,

        NTILE(3) OVER(
            ORDER BY TotalPrice DESC
        ) AS category

    FROM Orders
)

SELECT
    CASE
        WHEN category = 1 THEN 'Gold'
        WHEN category = 2 THEN 'Silver'
        ELSE 'Bronze'
    END AS order_value_bucket,

    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice),2) AS revenue,
    ROUND(AVG(TotalPrice),2) AS avg_order_value

FROM categorized_orders
GROUP BY order_value_bucket
ORDER BY revenue DESC;


SELECT
	MIN(Date),
	MAX(Date)
FROM Orders;

WITH monthly_revenue AS (

    SELECT 
        DATE_TRUNC('month', Date) AS month,
        SUM(TotalPrice) AS revenue

    FROM Orders
    GROUP BY month
)

SELECT
    month,
    revenue,

    LAG(revenue) OVER(
        ORDER BY month
    ) AS previous_month,

    ROUND(
        (
            (revenue - LAG(revenue) OVER(ORDER BY month))
            /
            LAG(revenue) OVER(ORDER BY month)
        ) * 100,
        2
    ) AS mom_growth_percentage

FROM monthly_revenue
ORDER BY month;


SELECT
    EXTRACT(YEAR FROM Date) AS year,
    SUM(TotalPrice) AS revenue,
    LAG(SUM(TotalPrice)) OVER (
        ORDER BY EXTRACT(YEAR FROM Date)
    ) AS previous_year_revenue,
    
    ROUND(
        (
            (SUM(TotalPrice) - LAG(SUM(TotalPrice)) OVER (
                ORDER BY EXTRACT(YEAR FROM Date)
            ))
            /
            LAG(SUM(TotalPrice)) OVER (
                ORDER BY EXTRACT(YEAR FROM Date)
            )
        ) * 100,
        2
    ) AS yoy_growth_percentage

FROM Orders
GROUP BY year
ORDER BY year;

SELECT
    EXTRACT(MONTH FROM Date) AS month,
    Product,
    SUM(Quantity) AS units_sold
FROM Orders
GROUP BY month, Product
ORDER BY month, units_sold DESC;

SELECT
    TRIM(TO_CHAR(Date, 'Day')) AS weekday,
    COUNT(*) AS orders,
    SUM(TotalPrice) AS revenue
FROM Orders
GROUP BY
	EXTRACT(DOW FROM Date),
    weekday
	ORDER BY EXTRACT(DOW FROM Date);

SELECT
    ReferralSource,
    OrderStatus,
    COUNT(*) AS orders,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER(PARTITION BY ReferralSource),
        2
    ) AS status_percentage
FROM Orders
GROUP BY ReferralSource, OrderStatus
ORDER BY ReferralSource, status_percentage DESC;
