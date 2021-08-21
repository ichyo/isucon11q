ALTER TABLE isu_condition ADD COLUMN `condition_level` VARCHAR(15);

UPDATE isu_condition SET `condition_level` = CASE
WHEN CEIL((LENGTH(`condition`) - LENGTH(replace(`condition`, '=true', ''))) / 5) <= 0 THEN 'info'
WHEN CEIL((LENGTH(`condition`) - LENGTH(replace(`condition`, '=true', ''))) / 5) <= 2 THEN 'warning'
WHEN CEIL((LENGTH(`condition`) - LENGTH(replace(`condition`, '=true', ''))) / 5) <= 3 THEN 'critical'
ELSE 'error'
END;
