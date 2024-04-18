
SET @curday = curdate();
SET @firstweekday = SUBDATE(@curday, WEEKDAY(@curday));

SET @sql = CONCAT(
    'SELECT
        CONCAT(CASE WHEN orders.created_at = ? THEN orders.uuid ELSE 0 END,"::", SUM(JSON_EXTRACT(orders.products,"$[*].quantity"))) AS "Monday ', @firstweekday, '",
         CONCAT(CASE WHEN orders.created_at = ADDDATE(?, 1) THEN orders.uuid ELSE 0 END,"::", SUM(JSON_EXTRACT(orders.products,"$[*].quantity")))  AS "Tuesday ', ADDDATE(@firstweekday, INTERVAL 1 DAY), '",
         CONCAT(CASE WHEN orders.created_at = ADDDATE(?, 2) THEN orders.uuid ELSE 0 END,"::", SUM(JSON_EXTRACT(orders.products,"$[*].quantity")))  AS "Wednesday ', ADDDATE(@firstweekday, INTERVAL 2 DAY), '",
         CONCAT(CASE WHEN orders.created_at = ADDDATE(?, 3) THEN orders.uuid ELSE 0 END,"::", SUM(JSON_EXTRACT(orders.products,"$[*].quantity"))) AS "Thursday ', ADDDATE(@firstweekday, INTERVAL 3 DAY), '",
         CONCAT(CASE WHEN orders.created_at = ADDDATE(?, 4) THEN orders.uuid ELSE 0 END,"::", SUM(JSON_EXTRACT(orders.products,"$[*].quantity")))  AS "Friday ', ADDDATE(@firstweekday, INTERVAL 4 DAY), '",
         CONCAT(CASE WHEN orders.created_at = ADDDATE(?, 5) THEN orders.uuid ELSE 0 END,"::", SUM(JSON_EXTRACT(orders.products,"$[*].quantity")))  AS "Saturday ', ADDDATE(@firstweekday, INTERVAL 5 DAY), '",
         CONCAT(CASE WHEN orders.created_at = ADDDATE(?, INTERVAL 6 DAY) THEN orders.uuid ELSE 0 END,"::", SUM(JSON_EXTRACT(orders.products,"$[*].quantity")))  AS "Sunday ', ADDDATE(@firstweekday, INTERVAL 6 DAY), '"
    FROM orders
    WHERE orders.created_at BETWEEN ? AND ADDDATE(?, INTERVAL 6 DAY)'
);

PREPARE stmt FROM @sql;
EXECUTE stmt USING @firstweekday, @firstweekday, @firstweekday, @firstweekday, @firstweekday, @firstweekday, @firstweekday, @firstweekday, @firstweekday;
DEALLOCATE PREPARE stmt;