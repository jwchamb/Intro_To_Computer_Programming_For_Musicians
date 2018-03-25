CREATE OR REPLACE FUNCTION final_project.get_key_signatures ()
 RETURNS TABLE (
  id INT
  , name VARCHAR(4)
  , value INT
)
AS $$
BEGIN
 RETURN QUERY SELECT
 k.id
 , k.symbol
 , k.root_offset
 FROM
  final_project.key k;
END; $$

LANGUAGE plpgsql;
