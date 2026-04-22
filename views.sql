-- Cloud Retail Analytics SQL Views

-- Monthly Sales
CREATE OR REPLACE VIEW `ordinal-skyline-493511-v3.retail_data.vw_monthly_sales` AS
SELECT
  EXTRACT(YEAR FROM Order_Date) AS Year,
  EXTRACT(MONTH FROM Order_Date) AS Month,
  SUM(Sales) AS Monthly_Sales
FROM `ordinal-skyline-493511-v3.retail_data.clean_superstore`
GROUP BY Year, Month
ORDER BY Year, Month;

-- Regional Performance
CREATE OR REPLACE VIEW `ordinal-skyline-493511-v3.retail_data.vw_regional_performance` AS
SELECT
  Region,
  Country,
  SUM(Sales) AS Total_Sales,
  SUM(Profit) AS Total_Profit,
  ROUND(SUM(Profit) / SUM(Sales), 2) AS Profit_Margin,
  COUNT(Order_ID) AS Total_Orders
FROM `ordinal-skyline-493511-v3.retail_data.clean_superstore`
GROUP BY Region, Country;

-- Shipping Performance
CREATE OR REPLACE VIEW `ordinal-skyline-493511-v3.retail_data.vw_shipping_performance` AS
SELECT
  Ship_Mode,
  Region,
  AVG(Shipping_Days) AS Avg_Shipping_Days,
  COUNT(*) AS Total_Orders
FROM `ordinal-skyline-493511-v3.retail_data.clean_superstore`
GROUP BY Ship_Mode, Region;