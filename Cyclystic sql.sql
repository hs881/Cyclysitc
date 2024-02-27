--Finding out the month with the most rides

SELECT
    EXTRACT(MONTH FROM started_at) AS month,
    COUNT(*) AS total_rides
FROM
    all_rides
GROUP BY
    month
ORDER BY
    total_rides DESC
LIMIT 1;

--Average ride duration by month for member and casual users

SELECT
    EXTRACT(MONTH FROM started_at) AS month,
    member_casual,
    AVG(EXTRACT(EPOCH FROM (ended_at - started_at))) / 60 AS average_duration_minutes
FROM
    all_rides
GROUP BY
    month, member_casual
ORDER BY
    month, member_casual;