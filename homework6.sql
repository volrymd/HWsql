DROP DATABASE IF EXISTS homework4;
CREATE DATABASE IF NOT EXISTS homework4;

-- Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DROP PROCEDURE seconds_to_date;

DELIMITER //
CREATE PROCEDURE seconds_to_date(seconds INT)
BEGIN
DECLARE days INT default 0;
DECLARE hours INT default 0;
DECLARE minutes INT default 0;

IF seconds >= 84600 THEN
	SET days = seconds / 86400;
	SET seconds = seconds % 86400;
	SET hours = seconds / 3600;
	SET seconds = seconds % 3600;
	SET minutes = seconds / 60;
	SET seconds = seconds % 60;
	SELECT CONCAT
	(
	days, ' days ',
	hours, ' hours ',
	minutes, ' minutes ',
	seconds, ' seconds'
	) AS date_time;
ELSEIF seconds >= 3600 THEN
	SET hours = seconds / 3600;
	SET seconds = seconds % 3600;
	SET minutes = seconds / 60;
	SET seconds = seconds % 60;
	SELECT CONCAT
	(
	hours, ' hours ',
	minutes, ' minutes ',
	seconds, ' seconds'
	) AS date_time;
ELSEIF seconds >= 60 THEN
	SET minutes = seconds / 60;
	SET seconds = seconds % 60;
	SELECT CONCAT
	(
	minutes, ' minutes ',
	seconds, ' seconds'
	) AS date_time;
ELSE 
	SELECT CONCAT 
	(
	seconds, ' seconds'
	) AS date_time;
END IF;

END //
DELIMITER ;

CALL seconds_to_date(123456);

-- Создайте функцию, которая выводит только четные числа от 1 до 10. Пример: 2,4,6,8,10 
DROP FUNCTION numbers;

DELIMITER //
CREATE FUNCTION numbers()
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE n INT default 2;
    DECLARE result VARCHAR(50) default '2';
    WHILE n < 10 DO
    SET n = n + 2;
    SET result = CONCAT(result, ' ', n);
    END WHILE;
	RETURN result;

END //
DELIMITER ;

SELECT numbers();
