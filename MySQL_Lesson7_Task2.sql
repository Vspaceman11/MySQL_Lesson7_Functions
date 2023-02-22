use carsshop;

DELIMITER |
DROP FUNCTION MinAge;
|

DELIMITER |
CREATE FUNCTION MinAge()
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
	RETURN(SELECT MIN(age) FROM clients);
END
|

DELIMITER |
SELECT MinAge() as MinAge;
|

SELECT cl.name, MinAge() as Age, m.mark, c.model FROM marks m 
    INNER JOIN cars c ON m.id = c.mark_id
    INNER JOIN orders o ON o.car_id = c.id
    INNER JOIN clients cl ON o.client_id = cl.id
    WHERE cl.age = MinAge();