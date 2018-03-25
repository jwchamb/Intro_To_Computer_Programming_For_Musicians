--SELECT * FROM interval;
--SELECT * FROM chord_name;
--SELECT * FROM chord_structure;
SELECT * FROM chord_roman;
--SELECT * FROM scale_name;
--SELECT * FROM scale;

SELECT
  sn.name
  , sc.degree
  , inter.name "Interval"
FROM scale_name sn
  JOIN scale sc ON sc.scale_name_id = sn.id
  JOIN interval inter ON sc.interval_id = inter.id
ORDER BY
  sn.name
  , sc.degree;
