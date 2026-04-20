##### Insights
WITH final_status_per_user AS (
  SELECT
    student_id,
    MAX(CASE WHEN `final status` = 'Dropout' THEN 1 ELSE 0 END) AS is_dropout
  FROM `edtech-493811.ededed.123423121212`
  GROUP BY student_id
)
, first_week AS (
  SELECT
    student_id,
    engagement_index
  FROM `edtech-493811.ededed.123423121212`
  WHERE week = 1
)
, combined AS (
  SELECT
    f.student_id,
    f.engagement_index,
    s.is_dropout
  FROM first_week f
  JOIN final_status_per_user s
    ON f.student_id = s.student_id
)
SELECT
  CASE
    WHEN engagement_index >= 70 THEN 'High'
    WHEN engagement_index >= 40 THEN 'Medium'
    ELSE 'Low'
  END AS engagement_level,
  
  COUNT(*) AS total_users,
  SUM(is_dropout) AS dropped_users,
  ROUND(SUM(is_dropout) / COUNT(*), 2) AS dropout_rate

FROM combined
GROUP BY engagement_level;

