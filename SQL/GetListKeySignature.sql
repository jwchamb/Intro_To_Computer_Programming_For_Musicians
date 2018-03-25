CREATE OR REPLACE FUNCTION final_project.get_key_signatures ()
 RETURNS TABLE (
  id INT,
  name VARCHAR
)
AS $$
BEGIN
 RETURN QUERY SELECT
 k.id
 , k.symbol
 FROM
  final_project.key k;
END; $$

LANGUAGE plpgsql;
