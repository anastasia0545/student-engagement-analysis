#### Engagement distribution over time
WITH base AS (
  SELECT
    student_id,
    week,
    engagement_index,
    `final status` AS final_status
  FROM `edtech-493811.ededed.123423121212`
),


segmented AS (
  SELECT
    *,
    CASE
      WHEN engagement_index >= 70 THEN 'High'
      WHEN engagement_index >= 40 THEN 'Medium'
      ELSE 'Low'
    END AS engagement_level
  FROM base
)


SELECT
  engagement_level,
  week,
  COUNT(DISTINCT student_id) AS users
FROM segmented
GROUP BY engagement_level, week
ORDER BY engagement_level, week;
