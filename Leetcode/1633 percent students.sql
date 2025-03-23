SELECT 
    Register.contest_id,
    ROUND(
        COUNT(DISTINCT Register.user_id) / COUNT(DISTINCT Users.user_id) * 100.00, 
        2
    ) AS percentage
FROM Register
CROSS JOIN Users
GROUP BY Register.contest_id
ORDER BY percentage DESC, contest_id ASC;
