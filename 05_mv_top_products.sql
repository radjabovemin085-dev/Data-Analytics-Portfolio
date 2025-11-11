-- Materialized View
CREATE MATERIALIZED VIEW mv_top_products
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND AS
SELECT *
FROM (
    SELECT p.product_name,
           SUM(f.quantity) AS total_quantity,
           SUM(f.total_amount) AS total_revenue
    FROM fact_sales f
    JOIN dim_product p ON f.product_id = p.product_id
    GROUP BY p.product_name
    ORDER BY SUM(f.total_amount) DESC
)
WHERE ROWNUM <= 5;
