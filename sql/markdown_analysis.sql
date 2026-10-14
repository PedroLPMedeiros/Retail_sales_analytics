SELECT
  CASE 
    WHEN Discount_Percentage > 0 THEN 'Promotional Sale'
    ELSE 'Full Price Sale'
  END AS sale_type,
  COUNT(DISTINCT Order_ID) AS total_orders,
  SUM(Sales_Amount) AS gross_revenue,
  SUM(Profit) AS total_profit,
  ROUND(AVG(Discount_Percentage), 2) AS avg_discount_pct,
  ROUND(AVG(Sales_Amount), 2) AS aov,
  ROUND((SUM(Profit)/NULLIF(SUM(Sales_Amount), 0)) * 100, 2) AS profit_margin_pct

FROM `perfect-purpose-511111-t2.retail_data.retail_sales`
GROUP BY 1;