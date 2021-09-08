DELIMITER $$

CREATE PROCEDURE actor_in_film (IN p_film_id INT, OUT p_actor_count INT)
   READS SQL DATA
BEGIN
	SELECT COUNT(*) 
	FROM film_actor
	WHERE film_id = p_film_id
	AND actor_id = p_actor_id 
	INTO p_actor_count;
END

$$