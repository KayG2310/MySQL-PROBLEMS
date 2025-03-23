SELECT 
    t1.user_id,
    round(COALESCE(
        SUM(CASE WHEN t2.action = 'confirmed' THEN 1 ELSE 0 END) / 
        NULLIF(SUM(CASE WHEN t2.action IN ('confirmed', 'timeout') THEN 1 ELSE 0 END), 0), 
        0
    ), 2) AS confirmation_rate
FROM Signups t1
LEFT JOIN Confirmations t2
ON t1.user_id = t2.user_id
GROUP BY t1.user_id;
