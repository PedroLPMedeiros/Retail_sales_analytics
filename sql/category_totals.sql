WITH category_totals AS (
  SELECT
    Product_Category AS category,
    COUNT(DISTINCT Order_ID) AS total_orders,
    ROUND(SUM(Sales_Amount), 2) AS category_revenue,
    ROUND(SUM(Profit), 2) AS category_profit,
    AVG(Sales_Amount) AS category_aov
  FROM 
    `perfect-purpose-511111-t2.retail_data.retail_sales`
  GROUP BY Product_Category
)
SELECT
  category,
  total_orders,
  category_revenue,
  category_profit,
  ROUND((category_profit/NULLIF(category_revenue, 0)) *100, 2) AS profit_margin_pct,
  ROUND(category_aov) AS aov,
  ROUND((category_revenue / SUM(category_revenue) OVER ()) * 100, 2) AS revenue_share_pct
FROM 
  category_totals
ORDER BY
  category_totals.category_revenue DESC;