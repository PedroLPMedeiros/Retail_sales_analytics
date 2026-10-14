SELECT 
  CASE 
    WHEN Customer_Age < 25 THEN 'GEN Z (<25)'
    WHEN Customer_Age BETWEEN 25 AND 40 THEN 'Millenials (25-40)'
    WHEN Customer_Age BETWEEN 41 AND 55 THEN 'Gen X (41-55)'
    ELSE 'Boomers (55+)'
  END AS age_group,
  Customer_Gender AS gender,
  COUNT(DISTINCT Order_ID) AS total_orders,
  SUM(Sales_Amount) AS total_revenue,
  ROUND(AVG(Sales_Amount), 2) AS aov,
  ROUND((SUM(Profit)/NULLIF(SUM(Sales_Amount), 0)) * 100, 2) AS profit_margin_pct

FROM `perfect-purpose-511111-t2.retail_data.retail_sales`
Group By 1, 2
ORDER BY total_revenue DESC;