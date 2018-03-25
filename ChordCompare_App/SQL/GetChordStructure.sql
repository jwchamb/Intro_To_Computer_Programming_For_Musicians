CREATE OR REPLACE FUNCTION final_project.get_chord_structure(chord_symbol VARCHAR(4))
 RETURNS TABLE (
   semitones INT
)
AS $$
BEGIN
 RETURN QUERY SELECT
  i.semitones
 FROM
  final_project.chord_roman cr
 JOIN final_project.chord_structure cs
 ON cr.chord_type_id = cs.type_id
 JOIN final_project.interval i
 ON cs.interval_id = i.id
 WHERE cr.symbol = chord_symbol;
END; $$

LANGUAGE plpgsql;
