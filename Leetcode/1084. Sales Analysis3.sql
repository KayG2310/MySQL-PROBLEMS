SELECT distinct s.product_id, p.product_name
FROM Product p, Sales s
WHERE p.product_id = s.product_id
  AND s.product_id IN (
      SELECT product_id
      FROM Sales
      GROUP BY product_id
      HAVING (MIN(sale_date) BETWEEN '2019-01-01' AND '2019-03-31') and (max(sale_date) BETWEEN '2019-01-01' AND '2019-03-31')
  );
