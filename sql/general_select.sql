SELECT 
  COUNT(DISTINCT Order_ID) AS total_orders,
  SUM(Sales_Amount) AS total_revenue,
  SUM(Profit) AS total_profit,
  ROUND((SUM(Profit) / NULLIF(SUM(Sales_Amount), 0)) * 100, 2) AS profit_margin_pct,
  ROUND(AVG(Sales_Amount), 2)  AS average_order_value_aov,
  SUM(Quantity) AS total_items_sold,
  ROUND(SUM(Quantity) * 1.0 / COUNT(Distinct Order_ID), 2) AS items_per_transaction_ipt
FROM 
  `perfect-purpose-511111-t2.retail_data.retail_sales`
LIMIT 1000;
