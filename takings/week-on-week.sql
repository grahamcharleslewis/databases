SELECT t.taking, w.week_no, w.day_name, w.day, w.month, w.year 
FROM takings t, week_date w
WHERE t.week_date_id = w.id
AND w.week_no = 25
AND w.year = 2021;

WITH const AS (SELECT 25 AS week_no, 2021 AS year)
SELECT t.taking, w.week_no, w.day_name, w.day, w.month, w.year 
FROM takings t, week_date w, const c
WHERE t.week_date_id = w.id
AND w.week_no = c.week_no
AND w.year = c.year;

