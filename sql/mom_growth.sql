WITH monthly_sales AS (
  SELECT 
    DATE_TRUNC(Order_Date, MONTH) as sales_month,
    SUM(Sales_Amount) AS monthly_revenue,
    SUM(Profit) AS monthly_profit,
  FROM `perfect-purpose-511111-t2.retail_data.retail_sales`
  GROUP BY 1
)
SELECT 
  sales_month,
  monthly_sales.monthly_revenue,
  monthly_sales.monthly_profit,
  LAG(monthly_revenue) OVER (ORDER BY sales_month) AS previous_month_revenue, --Variação percentual mês a mês
  ROUND(
    ((monthly_revenue - LAG(monthly_revenue) OVER(ORDER BY sales_month)) / NULLIF(LAG(monthly_revenue) OVER (ORDER BY sales_month), 0)) * 100, 2
  ) AS mom_growth_pct
FROM monthly_sales
ORDER BY sales_month;