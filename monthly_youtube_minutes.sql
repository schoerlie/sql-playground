WITH social_media_performance AS (
  SELECT
    *
  FROM
    `<source_1>`
  WHERE
    view_date >= '2022-01-01' )
    
SELECT
  (FORMAT_TIMESTAMP('%Y-%m', CAST(smp.view_date AS TIMESTAMP) )) AS view_date_month,
  COALESCE(SUM(smp.total_time_watched), 0) / 60 AS total_time_watched_minutes
FROM
  social_media_performance smp
WHERE smp.platform = 'YouTube'
  AND smp.account = '<ACCOUNT NAME>'
GROUP BY
  view_date_month
ORDER BY
  view_date_month
LIMIT
  100
  
