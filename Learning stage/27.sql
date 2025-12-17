WITH x AS (
    SELECT p.maker, pc.model, pc.speed, pc.ram
    FROM product p
    JOIN pc ON p.model = pc.model
    WHERE p.maker IN (
        SELECT maker
        FROM product
        WHERE type = 'printer'
    )
)
SELECT DISTINCT maker
FROM x
WHERE ram = (SELECT MIN(ram) FROM x)
  AND speed = (
      SELECT MAX(speed)
      FROM x
      WHERE ram = (SELECT MIN(ram) FROM x)
  );
