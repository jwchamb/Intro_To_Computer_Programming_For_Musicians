CREATE OR REPLACE FUNCTION final_project.get_roman_names ()
 RETURNS TABLE (
  id INT
  , name VARCHAR(10)
  , value INT
)
AS $$
BEGIN
 RETURN QUERY SELECT
 cr.id
 , cr.symbol
 , cr.degree
 FROM
  final_project.chord_roman cr;
END; $$

LANGUAGE plpgsql;
