
INSERT INTO chord_structure
  (type_id, interval_id)
  VALUES
  ((SELECT id FROM chord_type WHERE name = 'Major Triad')
    , (SELECT id FROM interval WHERE name = 'Unison'))
  , ((SELECT id FROM chord_type WHERE name = 'Major Triad')
    , (SELECT id FROM interval WHERE name = 'Major Third'))
  , ((SELECT id FROM chord_type WHERE name = 'Major Triad')
    , (SELECT id FROM interval WHERE name = 'Perfect Fifth'))

  , ((SELECT id FROM chord_type WHERE name = 'Minor Triad')
    , (SELECT id FROM interval WHERE name = 'Unison'))
  , ((SELECT id FROM chord_type WHERE name = 'Minor Triad')
    , (SELECT id FROM interval WHERE name = 'Minor Third'))
  , ((SELECT id FROM chord_type WHERE name = 'Minor Triad')
    , (SELECT id FROM interval WHERE name = 'Perfect Fifth'))

  , ((SELECT id FROM chord_type WHERE name = 'Diminished Triad')
    , (SELECT id FROM interval WHERE name = 'Unison'))
  , ((SELECT id FROM chord_type WHERE name = 'Diminished Triad')
    , (SELECT id FROM interval WHERE name = 'Minor Third'))
  , ((SELECT id FROM chord_type WHERE name = 'Diminished Triad')
    , (SELECT id FROM interval WHERE name = 'Diminished Fifth'))

  , ((SELECT id FROM chord_type WHERE name = 'Augmented Triad')
    , (SELECT id FROM interval WHERE name = 'Unison'))
  , ((SELECT id FROM chord_type WHERE name = 'Augmented Triad')
    , (SELECT id FROM interval WHERE name = 'Major Third'))
  , ((SELECT id FROM chord_type WHERE name = 'Augmented Triad')
    , (SELECT id FROM interval WHERE name = 'Augmented Fifth'));
