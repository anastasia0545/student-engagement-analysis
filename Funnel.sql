### Funnel
SELECT
  COUNT(DISTINCT student_id) AS total_users,
  COUNT(DISTINCT IF(week >= 2, student_id, NULL)) AS reached_week2,
  COUNT(DISTINCT IF(week >= 4, student_id, NULL)) AS reached_week4,
  COUNT(DISTINCT IF(`final status` = 'Active', student_id, NULL)) AS completed
FROM `edtech-493811.ededed.123423121212`;