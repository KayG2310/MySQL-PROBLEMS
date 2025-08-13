-- Solution for LeetCode 1327: Products a and b with at least 100 units sold in February 2020

SELECT
    -- Select the product name and the sum of units sold
    p.product_name,
    SUM(o.unit) AS unit
FROM
    -- Join the Products and Orders tables on their common product_id
    Products AS p
JOIN
    Orders AS o
    ON p.product_id = o.product_id
WHERE
    -- Filter the orders to include only those placed in February 2020
    o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY
    -- Group the results by product ID to aggregate units for each product
    p.product_id,
    p.product_name
HAVING
    -- Filter the groups to show only products with a total of 100 or more units sold
    SUM(o.unit) >= 100;
