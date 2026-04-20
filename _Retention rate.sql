#### Retention rate
WITH cohort AS (
  SELECT
    student_id,
    MIN(week) AS first_week
  FROM `edtech-493811.ededed.123423121212`
  GROUP BY student_id
),

activity AS (
  SELECT
    c.student_id,
    c.first_week,
    d.week
  FROM cohort c
  JOIN `edtech-493811.ededed.123423121212` d
    ON c.student_id = d.student_id
)

SELECT
  week,
  COUNT(DISTINCT student_id) AS active_users,
  ROUND(
    COUNT(DISTINCT student_id) / 
    (SELECT COUNT(DISTINCT student_id) FROM cohort),
    2
  ) AS retention_rate
FROM activity
GROUP BY week
ORDER BY week;